class Api::V1::PostsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:update]
  
  def index
    serializer_responder PostQuery.new.posts.near_to(current_jwt_authable), nil, PostSerializer
  end

  def create
    serializer_responder PostService.new(current_jwt_authable).create(post_params) 
  end

  def mine
    serializer_responder PostQuery.new.posts.belongs_to(current_jwt_authable).with_pagination(params[:page]), nil, PostSerializer
  end

  private

  def load_resource
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:postable_id, :postable_type, :content)
  end
  
end
