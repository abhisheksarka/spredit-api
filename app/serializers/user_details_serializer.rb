class UserDetailsSerializer < ApplicationSerializer
  attributes :id, 
             :provider, 
             :name,
             :uid,
             :email,
             :gender,
             :profile_picture,
             :profile_picture_medium,
             :unread_notifications_count,
             :post_category_configuration
              
  has_one :location
  has_one :location_configuration

  def unread_notifications_count
    # TODO move this query call out of here
    PostQuery.new.posts.belongs_to(object).with_notifications.count
  end
end