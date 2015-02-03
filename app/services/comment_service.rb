class CommentService
  attr_accessor :comment_publishable

  def initialize(comment_publishable)
    @comment_publishable = comment_publishable
  end

  def create(comment_params)
    comment = comment_publishable.create(comment_params)
    if comment.valid? and comment.persisted?
      comment.reload
      create_notification(comment)
    end
    comment
  end

  private

  def create_notification(comment)
    NotificationService.new(Notification.action_types[:commented])
    .from(comment_publishable)
    .to(comment.commentable.post_publishable)
    .for(comment)
    .notify
  end
end