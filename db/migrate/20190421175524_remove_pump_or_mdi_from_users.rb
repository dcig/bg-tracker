class RemovePumpOrMdiFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pump_or_mdi, :string
  end
end
