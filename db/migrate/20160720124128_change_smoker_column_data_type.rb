class ChangeSmokerColumnDataType < ActiveRecord::Migration
  def change
    change_column :profiles, :smoker, 'boolean USING CAST(smoker AS boolean)'
  end
end
