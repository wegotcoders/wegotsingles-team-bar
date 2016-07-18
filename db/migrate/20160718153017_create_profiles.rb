class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :star_sign
      t.integer :customer_id
      t.timestamps null: false
    end
  end
end
