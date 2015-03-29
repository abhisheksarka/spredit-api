class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :comment_publishable, polymorphic: true
  acts_as_votable
  
  include Activity::Causable
  activity_sender { | m | m.comment_publishable }
  activity_target { | m | m.commentable }
  activity_action { 'commented' }
  activity_receiver do | m | 
    m.commentable.post_publishable if m.commentable_type == 'Post' 
  end
  after_save :update_counter_cache

  private
  
  def update_counter_cache
    commentable.update(comments_count: commentable.comments.length)
  end
end
