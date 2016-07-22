class MessagesController < ApplicationController

  def index
    @message = Message.new
    @received_messages = current_customer.received_messages
  end

  def create
    if Message.create!(message_params)
      flash[:notice] = "Your message has been sent"
    else
      flash[:error] = "There has been an error sending your message"
    end
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id, :replied_to_id)
  end

end
