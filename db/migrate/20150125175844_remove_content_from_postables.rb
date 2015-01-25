class RemoveContentFromPostables < ActiveRecord::Migration
  def self.up
    remove_column :post_photos, :content
    remove_column :post_texts, :content
  end

  def self.down
    add_column :post_photos, :content, :text
    add_column :post_texts, :content, :text
  end
end
