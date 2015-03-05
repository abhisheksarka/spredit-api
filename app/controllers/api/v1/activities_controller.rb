class Api::V1::ActivitiesController < Api::V1::ApplicationController
  before_filter :authenticate_token

  def index
    serializer_responder ActivityQuery.new.activities.belongs_to(current_jwt_authable).with_pagination(params[:page]), nil, ActivitySerializer
  end
  
end
