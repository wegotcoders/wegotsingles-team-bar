class AddDesiresToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :desires, :text, default: ""
  end
end
