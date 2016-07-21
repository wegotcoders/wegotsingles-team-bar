class AddEthnicityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :ethnicity, :integer
  end
end
