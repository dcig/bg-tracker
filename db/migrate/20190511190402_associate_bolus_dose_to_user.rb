class AssociateBolusDoseToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :bolus_doses, :user_id, :int
  end
end
