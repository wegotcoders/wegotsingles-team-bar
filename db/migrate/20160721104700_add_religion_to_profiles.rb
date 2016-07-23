class AddReligionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :religion, :string
  end
end
