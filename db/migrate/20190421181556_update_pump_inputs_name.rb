class UpdatePumpInputsName < ActiveRecord::Migration[5.1]
  def change
    rename_table :pump_inputs, :basal_dose
  end
end
