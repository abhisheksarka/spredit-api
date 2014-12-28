class AddCategoryIdToConversations < ActiveRecord::Migration
  def self.up
    add_reference :conversations, :categories, index: true
  end

  def self.down
    remove_reference :conversations, :categories
  end
end
