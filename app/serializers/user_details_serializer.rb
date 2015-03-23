class UserDetailsSerializer < ApplicationSerializer
  attributes :id, 
             :provider, 
             :name,
             :uid,
             :email,
             :gender,
             :profile_picture,
             :profile_picture_medium,
             :unread_notifications_count
  has_one :location
  has_one :location_configuration

  def unread_notifications_count
    # TODO move this query call out of here
    ActivityQuery.new.activities.notifications(object).count
  end
end