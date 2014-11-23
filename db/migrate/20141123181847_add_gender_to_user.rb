class AddGenderToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :gender, :string
  end
end
