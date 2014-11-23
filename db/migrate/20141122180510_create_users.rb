class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :name
      t.string :uid
      t.string :oauth_token
      t.datetime :expires_at
      t.string :email

      t.timestamps
    end
  end
end
