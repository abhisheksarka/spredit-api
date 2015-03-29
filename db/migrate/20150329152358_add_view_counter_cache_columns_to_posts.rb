class AddViewCounterCacheColumnsToPosts < ActiveRecord::Migration
  def self.up
  	add_column :posts, :views_count, :integer, :default => 0
  	
  	Post.all.each do | p |
  		p.update(views_count: p.views.length)
  	end
  end

  def self.down
  	remove_column :posts, :views_count
  end
end
