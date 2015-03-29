class AddCacheColumnsToPosts < ActiveRecord::Migration
  def self.up
  	add_column :posts, :spreads_count, :integer, :default => 0
  	add_column :posts, :contains_count, :integer, :default => 0
  	add_column :posts, :comments_count, :integer, :default => 0
  	
  	Post.all.each do | p |
  		p.update(spreads_count: p.spreads.length)
  		p.update(contains_count: p.contains.length)
  		p.update(comments_count: p.comments.length)
  	end
  end

  def self.down
  	remove_column :posts, :spreads_count
  	remove_column :posts, :contains_count
  	remove_column :posts, :comments_count
  end
end
