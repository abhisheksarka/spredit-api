class PostPhoto < ActiveRecord::Base
  include Postable
  mount_uploader :photo, PhotoUploader
end
