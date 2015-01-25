class Api::V1::PostsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:update]
  
  def index
    serializer_responder PostService.new(current_jwt_authable).query, nil, PostSerializer
  end

  def create
    serializer_responder PostService.new(current_jwt_authable).create(post_params, postable_params) 
  end

  def update
  end

  def destroy
  end

  private

  def load_resource
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:postable_type)
  end

  def postable_params
    params.require(:postable).permit(:content, :photo)
  end
  
end
