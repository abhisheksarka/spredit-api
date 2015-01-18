class Spread < ActiveRecord::Base
  include ActiveModel::Validations

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
      contain: 'contain'
    }  
  end
end
