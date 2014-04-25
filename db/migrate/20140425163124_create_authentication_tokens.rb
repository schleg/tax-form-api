class CreateAuthenticationTokens < ActiveRecord::Migration
  def change
    create_table :authentication_tokens do |t|
      t.integer :user_id
      t.string :token
      t.datetime :expiry_at

      t.timestamps
    end
  end
end
