require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'receiving messages' do

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

    it 'should show up in the receivers inbox' do
      expect(@receiver.messages).to include(@message)
    end
  end
end
