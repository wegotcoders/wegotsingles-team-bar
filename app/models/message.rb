class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "Customer", foreign_key: :sender_id
  belongs_to :receiver, class_name: "Customer", foreign_key: :receiver_id

  def history
    history = []
    message = self

    loop do
      break if message.replied_to_id.nil?
      message = Message.find(message.replied_to_id)
      history << message
    end
    history
  end
end
