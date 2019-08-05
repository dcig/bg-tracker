class CreateDexcomAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :dexcom_access_tokens do |t|
      t.string :access_token
      t.integer :expires_in
      t.string :refresh_token
      t.integer :user_id

      t.timestamps
    end
  end
end
