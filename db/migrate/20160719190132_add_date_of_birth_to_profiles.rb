class AddDateOfBirthToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :date_of_birth, :date
  end
end
