class Api::V1::Configuration::LocationsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource
  
  def update
    @configuration_location.update(configuration_location_params)
    serializer_responder @configuration_location.reload
  end

  private

  def load_resource
    @configuration_location = current_jwt_authable.location_configuration
  end

  def configuration_location_params
    params.permit(:radius)
  end
  
end
