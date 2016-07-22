class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "Customer", foreign_key: :sender_id
  belongs_to :receiver, class_name: "Customer", foreign_key: :receiver_id
end
