class Post < ActiveRecord::Base
  include Locatable
  lc_location_configurable false
  
  include Spreadable

  belongs_to :postable, polymorphic: true
  belongs_to :post_publishable, polymorphic: true
  before_create :set_location

  private

  def set_location
    l = self.post_publishable.location
    self.location = Location.new({
      latitude: l.latitude,
      longitude: l.longitude,
      locatable_type: 'Post'
    })
  end
end
