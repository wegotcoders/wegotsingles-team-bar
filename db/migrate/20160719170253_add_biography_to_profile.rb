class AddBiographyToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :biography, :text, default: ""
  end
end
