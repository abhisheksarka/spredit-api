class Api::V1::PostsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:update, :spread]
  
  def create
    serializer_responder PostService.new(current_jwt_authable, post_params, postable_params).create 
  end

  def spread
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
    params.require(:post).permit(
      :postable_type, 
      postable: [:content]
    )
  end

  def postable_params
    params.require(:postable).permit(:content)
  end
  
end
