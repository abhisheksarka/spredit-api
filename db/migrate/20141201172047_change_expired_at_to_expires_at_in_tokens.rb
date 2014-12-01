class ChangeExpiredAtToExpiresAtInTokens < ActiveRecord::Migration
  def self.up
    rename_column :jw_tokens, :expired_at, :expires_at
  end
  def self.down
    remove_column :jw_tokens, :expires_at, :expired_at
  end
end
