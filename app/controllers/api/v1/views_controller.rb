class Api::V1::ViewsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  
  def create
    serializer_responder current_jwt_authable.viewed.create(view_params)
  end

  private

  def view_params
    params.require(:view).permit(:viewable_id, :viewable_type)
  end
  
end
