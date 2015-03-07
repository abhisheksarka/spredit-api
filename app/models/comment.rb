class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :comment_publishable, polymorphic: true

  include Activity::Causable
  activity_sender { | m | m.comment_publishable }
  activity_target { | m | m.commentable }
  activity_action { 'commented' }
  activity_receiver do | m | 
    m.commentable.post_publishable if m.commentable_type == 'Post' 
  end
end
