class PostPhoto < ActiveRecord::Base
  include Postable
  mount_uploader :photo, PhotoUploader
  validate :photo_size_validation
  
  private
  
  def photo_size_validation
    errors[:photo] << "should be less than 5MB" if photo.size > 5.megabytes
  end
end
