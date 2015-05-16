class AddUnreadTargetedActivitiesCounterCacheColumnToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :unread_targeted_activities_count, :integer, :default => 0
    
    Post.all.each do | p |
      p.update(unread_targeted_activities_count: p.unread_targeted_activities.length)
    end
  end

  def down
    remove_column :posts, :unread_targeted_activities_count
  end
end
