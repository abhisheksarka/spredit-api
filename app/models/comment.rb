class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :comment_publishable, polymorphic: true

  include Activity::Causable
  activity_sender do | m |
    m.comment_publishable 
  end
  activity_receiver do | m | 
    m.commentable.post_publishable if m.commentable_type == 'Post' 
  end
  activity_action do 
    'commented' 
  end
end
