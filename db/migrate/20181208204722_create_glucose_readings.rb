class CreateGlucoseReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :glucose_readings do |t|
      t.integer :bg_value
      t.time :time_stamp

      t.timestamps
    end
  end
end
