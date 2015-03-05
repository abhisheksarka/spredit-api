class Spread < ActiveRecord::Base
  include ActiveModel::Validations

  include Activity::Causable
  activity_sender do | m |
    m.spread_publishable 
  end
  activity_receiver do | m | 
    m.spreadable.post_publishable if m.spreadable_type == 'Post' 
  end
  activity_target do | m | 
    m.spreadable 
  end
  activity_action do | m |
    m.action 
  end

  belongs_to :spreadable, polymorphic: true
  belongs_to :spread_publishable, polymorphic: true

  validates :spreadable_id, presence: true
  validates :spread_publishable_id, presence: true
  validates :spreadable_type, presence: true
  validates :spread_publishable_type, presence: true
  validates_with SpreadValidator, on: :create
  
  def self.actions
    {
      spread: 'spread',
      contained: 'contained'
    }  
  end
end
