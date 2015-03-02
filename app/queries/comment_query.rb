class CommentQuery
  attr_accessor :comments

  def initialize(comments = Comment.all)
    @comments = comments.extending(Scopes)
  end

  module Scopes
    def for_commentable(params)
      eager_load
      .where(commentable_id: params[:commentable_id], commentable_type: params[:commentable_type])
      .order(created_at: :desc)
    end

    def with_pagination(page, per_page=15)
      paginate(page: page, per_page: per_page)
    end

    private

    def eager_load
      includes(:comment_publishable)
    end
  end
end
