module CommentPublishable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :comment_publishable
  end

  module ClassMethods
  end
end
