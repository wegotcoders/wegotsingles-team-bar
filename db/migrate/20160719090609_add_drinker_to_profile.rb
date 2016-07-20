class AddDrinkerToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :drinker, :boolean
  end
end
