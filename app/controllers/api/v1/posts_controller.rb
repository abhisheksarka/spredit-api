class Api::V1::PostsController < Api::V1::ApplicationController
  rescue_from ::ActionController::ParameterMissing do | e | 
    handle_api_exception(ApiException.new(ApiException.post_invalid))
  end

  before_filter :authenticate_token
  before_filter :load_resource, only: [:update, :show]
  
  def index
    serializer_responder PostQuery.new.posts.near_to(current_jwt_authable), nil, PostSerializer
  end

  def create
    serializer_responder PostService.new(current_jwt_authable).create(post_params) 
  end

  def show
    serializer_responder @post, PostSerializer
  end

  def categories
    serializer_responder Post.categories
  end

  def mine
    serializer_responder PostQuery.new.posts.belongs_to(current_jwt_authable).with_pagination(params[:page]), nil, PostSerializer
  end

  private

  def load_resource
    @post = Post.find_by_encrypted_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:postable_id, :postable_type, :content, :title, :category)
  end
  
end
