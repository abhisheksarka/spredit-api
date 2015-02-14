class AddProfilePicMediumToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_picture_medium, :string
  end

  def self.down
    remove_column :users, :profile_picture_medium
  end
end
