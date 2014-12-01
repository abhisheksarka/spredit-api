class AddExpiredAtToJwTokens < ActiveRecord::Migration
  def self.up
    add_column :jw_tokens, :expired_at, :datetime
  end
  def self.down
    remove_column :jw_tokens, :expired_at
  end
end
