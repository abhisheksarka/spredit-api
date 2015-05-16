class CommentService
  attr_accessor :receivable

  def initialize(receivable)
    @receivable = receivable
  end

  def create(comment_params)
    comment = comment_publishable.comments.create(comment_params)
    if comment.valid? and comment.persisted?
      comment.reload
    end
    comment
  end
end