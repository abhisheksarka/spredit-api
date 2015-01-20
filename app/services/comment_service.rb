class CommentService
  attr_accessor :comment_publishable

  def initialize(comment_publishable)
    @comment_publishable = comment_publishable
  end

  def create(comment_params)
    comment_publishable.create(comment_params)
  end
end