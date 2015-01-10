class Api::V1::Configuration::LocationsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource
  
  def update
    @configuration_location.update(configuration_location_params)
    serializer_responder @configuration_location.reload
  end

  private

  def load_resource
    @configuration_location = ::Configuration::Location.find_by(params[:id])
  end

  def configuration_location_params
    params.permit(:radius, :configurable_location_id, :configurable_location_type)
  end
  
end
