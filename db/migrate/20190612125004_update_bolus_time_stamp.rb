class UpdateBolusTimeStamp < ActiveRecord::Migration[5.1]
  def change
    change_column :bolus_doses, :time_stamp, :datetime
  end
end
