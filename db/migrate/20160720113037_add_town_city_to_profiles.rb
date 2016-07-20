class AddTownCityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :town_city, :string
  end
end
