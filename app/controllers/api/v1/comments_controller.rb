class Api::V1::CommentsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:update]

  def create
    serializer_responder CommentService.new(current_jwt_authable).create(comment_params)
  end

  def index
    serializer_responder CommentQuery.new.comments.for_commentable(params).with_pagination(params[:page]), nil, CommentSerializer
  end

  private

  def load_resource
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :content)
  end
  
end
