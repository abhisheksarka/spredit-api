class Api::V1::ActivitiesController < Api::V1::ApplicationController
  before_filter :authenticate_token

  def index
    serializer_responder ActivityQuery.new.activities.belongs_to(current_jwt_authable).with_pagination(params[:page]), nil, ActivitySerializer
  end
  
  def notifications
    serializer_responder ActivityQuery.new.activities.notifications(current_jwt_authable).with_pagination(params[:page]), nil, NotificationSerializer
  end  

  def unread_notifications_count
  	serializer_responder({
  		count: ActivityQuery.new.activities.notifications(current_jwt_authable).count
  	})
  end
end
