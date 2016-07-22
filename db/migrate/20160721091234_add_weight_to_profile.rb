class AddWeightToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :weight, :decimal
  end
end
