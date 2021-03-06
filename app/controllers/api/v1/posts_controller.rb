class Api::V1::PostsController < Api::V1::ApplicationController
  rescue_from ::ActionController::ParameterMissing do | e | 
    handle_api_exception(ApiException.new(ApiException.post_invalid))
  end

  before_filter :authenticate_token, except: [:categories] 
  before_filter :load_resource, only: [:update, :show]
  before_filter :set_post_categories, only: [:index]
  
  def index
    serializer_responder PostQuery.new.posts.near_to(current_jwt_authable, @post_types), nil, PostSerializer
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
    serializer_responder PostQuery.new
    .posts
    .belongs_to(current_jwt_authable)
    .with_pagination(params[:page]), nil, PostSerializer
  end

  def with_new_notifications
    serializer_responder PostQuery.new
    .posts
    .belongs_to(current_jwt_authable)
    .with_notifications
    .with_pagination(params[:page], 50), nil, PostWithActivitiesSerializer
    # TODO fix this, per page should not be 50. This is a hack to make all notifications getting marked at once
  end

  private

  def load_resource
    @post = Post.find_by_encrypted_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:postable_id, :postable_type, :content, :category)
  end
  
  def set_post_categories
    @post_types = current_jwt_authable.post_category_configuration.values.split(',')
  end
end
