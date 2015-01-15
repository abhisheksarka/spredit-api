class Spread < ActiveRecord::Base
  belongs_to :spreadable, polymorphic: true
  belongs_to :spread_publishable, polymorphic: true
  
  validates_uniqueness_of :spread_publishable_id, scope: :spreadable_id

  validates :spreadable_id, presence: true
  validates :spread_publishable_id, presence: true

  validates :spreadable_type, presence: true
  validates :spread_publishable_type, presence: true
  
  def self.actions
    {
      spread: 'spread',
      contain: 'contain'
    }  
  end
end
