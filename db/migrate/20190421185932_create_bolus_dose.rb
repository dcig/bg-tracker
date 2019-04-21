class CreateBolusDose < ActiveRecord::Migration[5.1]
  def change
    create_table :bolus_doses do |t|
      t.float :amount
      t.time :timestamp

      t.timestamps
    end
  end
end
