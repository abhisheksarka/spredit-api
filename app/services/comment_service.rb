class CommentService
  attr_accessor :comment_publishable

  def initialize(comment_publishable)
    @comment_publishable = comment_publishable
  end

  def create(comment_params)
    comment = comment_publishable.comments.create(comment_params)
    if comment.valid? and comment.persisted?
      comment.reload
    end
    comment
  end
end