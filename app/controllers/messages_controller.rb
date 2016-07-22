class MessagesController < ApplicationController

  def index
    @received_messages = current_customer.messages
  end

end
