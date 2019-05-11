class AssociateUserToGlucoseReadings < ActiveRecord::Migration[5.1]
  def change
    add_column :glucose_readings, :user_id, :int
  end
end
