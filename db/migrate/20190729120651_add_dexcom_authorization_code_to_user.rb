class AddDexcomAuthorizationCodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :dexcom_authorization_code, :string
  end
end
