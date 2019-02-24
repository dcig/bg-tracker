class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :pump_input, :amount, :float
  end
end
