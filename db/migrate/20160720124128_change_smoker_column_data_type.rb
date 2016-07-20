class ChangeSmokerColumnDataType < ActiveRecord::Migration
  def change
    change_column :profiles, :smoker,  :boolean
  end
end
