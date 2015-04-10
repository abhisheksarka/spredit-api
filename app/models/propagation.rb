class Propagation < ActiveRecord::Base
  include Locatable
  has_one :location, -> { where(locatable_type: 'Propagation').order(id: :desc) }, 
                    class_name: 'Location', 
                    foreign_key: :locatable_id

  belongs_to :propagatable, polymorphic: true
end
