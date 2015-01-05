class Api::V1::LocationsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  
  def create
    serializer_responder Location.create(location_params)
  end

  private

  def location_params
    params.require(:location).permit(:locatable_id, :locatable_type, :latitude, :longitude)
  end
  
end
