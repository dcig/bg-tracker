class UpdateBasalTimeStamp < ActiveRecord::Migration[5.1]
  def change
    change_column :basal_doses, :time_stamp, :datetime
  end
end
