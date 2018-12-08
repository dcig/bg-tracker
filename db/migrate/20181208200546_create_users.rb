class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :basal_insulin
      t.string :bolus_insulin
      t.string :pump_or_mdi

      t.timestamps
    end
  end
end
