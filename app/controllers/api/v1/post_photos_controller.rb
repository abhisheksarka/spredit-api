class Api::V1::PostPhotosController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:destroy]

  def create
    # TDOO front job, not backend, remove it ASAP
    params[:meta] = {
      errorFlash: true
    }
    serializer_responder PostPhoto.create(post_photo_params) 
  end

  def destroy
    serializer_responder @post_photo.destroy
  end

  private

  def load_resource
    @post_photo = PostPhoto.find(params[:id])
  end

  def post_photo_params
    params.require(:post_photo).permit(:photo, :content)
  end
  
end
