class CreateAuthorizationToken < ActiveRecord::Migration
  def change
    create_table :authorization_tokens do |t|
      t.string :token
      t.datetime :revoked_at
      t.timestamps null: false
    end
  end
end
