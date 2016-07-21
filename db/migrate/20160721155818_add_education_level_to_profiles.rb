class AddEducationLevelToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :education, :string
  end
end
