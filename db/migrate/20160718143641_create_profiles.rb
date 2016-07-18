class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :biography
      t.decimal :weight
      t.decimal :height
      t.text :desire
      t.boolean :smoker
      t.boolean :drinker
      t.string :religious_beliefs
      t.string :education
      t.string :star_sign
      t.string :occupation
      t.string :ethnicity

      t.timestamps null: false
    end
  end
end
