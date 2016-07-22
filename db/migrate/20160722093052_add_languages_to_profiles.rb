class AddLanguagesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :languages, :string, array:true, default: []
  end
end
