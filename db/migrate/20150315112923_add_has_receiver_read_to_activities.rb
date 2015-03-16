class AddHasReceiverReadToActivities < ActiveRecord::Migration
  def self.up
  	add_column :activities, :has_receiver_read, :boolean, default: false
  end

  def self.down
  	remove_column :activities, :has_receiver_read
  end
end
