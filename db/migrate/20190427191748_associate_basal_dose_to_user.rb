class AssociateBasalDoseToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :basal_doses, :user_id, :int
  end
end
