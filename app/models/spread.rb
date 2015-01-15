class Spread < ActiveRecord::Base
  belongs_to :spreadable, polymorphic: true
  belongs_to :spread_publishable, polymorphic: true
  
  def self.actions
    {
      spread: 'spread',
      contain: 'contain'
    }  
  end
end
