class AddRepliedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :replied_to_id, :integer
  end
end
