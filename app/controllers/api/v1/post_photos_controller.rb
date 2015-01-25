class Api::V1::PostPhotosController < Api::V1::ApplicationController
  before_filter :authenticate_token

  def create
    serializer_responder PostPhoto.create(post_photo_params) 
  end

  private

  def post_photo_params
    params.require(:post_photo).permit(:photo, :content)
  end
  
end
