class CreatePumpInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :pump_inputs do |t|
      t.integer :amount
      t.time :time_stamp

      t.timestamps
    end
  end
end
