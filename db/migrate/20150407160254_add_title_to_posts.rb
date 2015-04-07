class AddTitleToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :title, :text
  end

  def self.down
    remove_column :posts, :title
  end
end
