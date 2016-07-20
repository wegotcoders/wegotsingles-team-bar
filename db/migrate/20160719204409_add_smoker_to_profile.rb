class AddSmokerToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :smoker, :text
  end
end
