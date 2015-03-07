class Api::V1::SpreadsController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource, only: [:update, :destroy]
  
  def create
    serializer_responder SpreadService.new(current_jwt_authable).create(spread_params), SpreadSerializer 
  end

  def publishers
    serializer_responder Spread.includes(:spread_publishable).where(spreadable_id: params[:spreadable_id], spreadable_type: params[:spreadable_type]), nil, SpreadWithSpreadPublishableSerializer
  end

  private

  def load_resource
    @spread = Spread.find(params[:id])
  end 

  def spread_params
    params.require(:spread).permit(:spreadable_type, :spreadable_id, :action)
  end
  
end
