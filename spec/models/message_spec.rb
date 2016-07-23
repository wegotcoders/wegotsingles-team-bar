require 'rails_helper'

RSpec.describe Message, type: :model do

  before do
    @sender = Customer.create!(
      username: "sender",
      email: "sender@somewhere.com",
      password: "password",
      password_confirmation: 'password'
    )

    @receiver = Customer.create!(
      username: "receiver",
      email: "receiver@somewhere.com",
      password: "password",
      password_confirmation: 'password'
    )

    @message = Message.new(sender: @sender, receiver: @receiver, body: "Hello")
    @receiver.received_messages << @message

    @reply = Message.create!(sender: @receiver, receiver: @sender, body: "Hi", replied_to_id: @message.id)
  end
  
  describe 'receiving messages' do
    it 'should show up in the receivers inbox' do
      expect(@receiver.received_messages).to include(@message)
    end
  end

  describe "replying to messages" do
    it "should allow a customer to send a reply to a messge that they have received" do
      expect(@reply.replied_to_id).to eq(@message.id)
      expect(@sender.received_messages).to include(@reply)
    end
  end

  describe "view a message history" do
    before do 
      @second_reply = Message.create!(
        body: "How's it going?",
        sender: @sender,
        receiver: @receiver,
        replied_to_id: @reply.id
      )

      @third_reply = Message.create!(
        body: "Pretty good thanks",
        sender: @receiver,
        receiver: @sender,
        replied_to_id: @second_reply.id
      )

      @history = @third_reply.history
    end

    it "should allow a customer to see their entire conversation history with another customer" do
      expect(@history.length).to eq(3)
      expect(@history.first).to eq(@second_reply)
      expect(@history.last).to eq(@message)
    end
  end

end
