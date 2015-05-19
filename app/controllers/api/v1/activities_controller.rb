class Api::V1::ActivitiesController < Api::V1::ApplicationController
  before_filter :authenticate_token

  def index
    activities = ActivityQuery.new.activities.belongs_to(current_jwt_authable).with_pagination(params[:page])
    serializer_responder(activities, nil, ActivitySerializer)
  end
  
  def notifications
    notifications = ActivityQuery.new.activities.notifications(current_jwt_authable).with_pagination(params[:page])
    serializer_responder(notifications, nil, NotificationSerializer)
  end  

  def mark_all_as_read
    ActivityQuery.new.activities.unread_notifications(current_jwt_authable).map { | n | n.update(has_receiver_read: true) }
    serializer_responder({ status: true })
  end

  def unread_notifications_count
    count = { count: ActivityQuery.new.activities.unread_notifications(current_jwt_authable).count }
  	serializer_responder(count)
  end
end
