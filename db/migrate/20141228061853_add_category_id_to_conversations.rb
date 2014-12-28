class AddCategoryIdToConversations < ActiveRecord::Migration
  def self.up
    add_reference :conversations, :category, index: true
  end

  def self.down
    remove_reference :conversations, :category
  end
end
