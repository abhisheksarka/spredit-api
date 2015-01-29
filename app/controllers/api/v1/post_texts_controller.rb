class Api::V1::PostTextsController < Api::V1::ApplicationController
  before_filter :authenticate_token

  def create
    serializer_responder PostText.create(post_text_params) 
  end

  private

  def load_resource
    @post_text = PostText.find(params[:id])
  end

  def post_text_params
    params.require(:post_text).permit()
  end
  
end
