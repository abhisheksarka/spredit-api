class CreateJwTokens < ActiveRecord::Migration
  def change
    create_table :jw_tokens do |t|
      t.string :value
      t.string :ip_address
      t.references :jw_tokenable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
