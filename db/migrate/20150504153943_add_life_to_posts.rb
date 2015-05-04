class AddLifeToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :life, :integer, default: 5
    Post.all.each do | p |
      l = (p.spreads_count + 5) - p.contains_count
      l = 0 if l < 0
      p.update(life: l)
    end
  end

  def down
    remove_column :posts, :life
  end
end
