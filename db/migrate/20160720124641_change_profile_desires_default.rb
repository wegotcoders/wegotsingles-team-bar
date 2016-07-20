class ChangeProfileDesiresDefault < ActiveRecord::Migration
  def change
    change_column :profiles, :desires,  :text
  end
end
