class Propagation < ActiveRecord::Base
  include Locatable
  belongs_to :propagatable, polymorphic: true
end
