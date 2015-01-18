class Api::V1::LocationsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:update]
  
  def index
    serializer_responder Location.where(locatable_id: params[:locatable_id], locatable_type: params[:locatable_type])
  end

  def create
    serializer_responder Location.create(location_params)
  end

  def update
    @location.update(location_params)
    serializer_responder @location.reload
  end

  private

  def load_resource
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:locatable_id, :locatable_type, :latitude, :longitude)
  end
  
end
