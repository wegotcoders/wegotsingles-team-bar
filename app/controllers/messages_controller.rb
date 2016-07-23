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

  def show
    find_message_history
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id, :replied_to_id)
  end

  def find_message
    @message = Message.find(params[:id])
  end

  def find_message_history
    @messages = find_message.history.reverse unless params[:id].nil?
  end

end
