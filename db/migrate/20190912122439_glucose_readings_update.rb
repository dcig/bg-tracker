class GlucoseReadingsUpdate < ActiveRecord::Migration[5.1]
  def change
    change_column :glucose_readings, :time_stamp, :datetime
  end
end
