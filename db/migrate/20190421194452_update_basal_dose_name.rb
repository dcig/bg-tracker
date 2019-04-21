class UpdateBasalDoseName < ActiveRecord::Migration[5.1]
  def change
    rename_table :basal_dose, :basal_doses
  end
end
