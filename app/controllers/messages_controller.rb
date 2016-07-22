class MessagesController < ApplicationController

  def index
    @received_messages = current_customer.received_messages
  end

end
