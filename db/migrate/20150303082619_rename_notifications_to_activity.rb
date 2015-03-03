class RenameNotificationsToActivity < ActiveRecord::Migration
  def self.up
    rename_table :notifications, :activities
  end

  def self.down
    rename_table :activities, :notifications
  end
end
