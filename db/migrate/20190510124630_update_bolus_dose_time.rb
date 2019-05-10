class UpdateBolusDoseTime < ActiveRecord::Migration[5.1]
  def change
    change_table :bolus_doses do |t|
    t.rename :timestamp, :time_stamp
    end
  end
end
