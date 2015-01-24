class CommentSerializer < BaseSerializer
  attributes :id, 
             :commentable_id,
             :commentable_type,
             :comment_publishable_id,
             :comment_publishable_type,
             :created_at,
             :content

  has_one :comment_publishable
end