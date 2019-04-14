class UpdateGlucoseReadingBgValue < ActiveRecord::Migration[5.1]
  def change
    change_column :glucose_readings, :bg_value, :float
  end
end
