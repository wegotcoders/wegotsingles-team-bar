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
    
    @receiver.messages << @message
  end
  
  describe 'receiving messages' do
    it 'should show up in the receivers inbox' do
      expect(@receiver.messages).to include(@message)
    end
  end

  describe "replying to messages" do
    it "should allow a customer to send a reply to a messge that they have received" do
      reply = Message.create!(sender: @receiver, receiver: @sender, body: "Hi", replied_to_id: @message.id)
      expect(reply.replied_to_id).to eq(@message.id)
      expect(@sender.messages).to include(reply)
    end
  end
end
