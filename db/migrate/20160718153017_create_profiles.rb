class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
			t.string :star_sign
      t.timestamps null: false
    end
  end
end
