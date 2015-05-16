class PostWithActivitiesSerializer < PostSerializer
  def new_comments_count
    object.unread_targeted_activities.select { |s| s.action == 'commented' }.count
  end

  def new_spreads_count
    object.unread_targeted_activities.select { |s| s.action == 'spread' }.count
  end

  def new_contains_count
    object.unread_targeted_activities.select { |s| s.action == 'contained' }.count
  end
end