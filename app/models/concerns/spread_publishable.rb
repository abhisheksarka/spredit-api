module SpreadPublishable
  extend ActiveSupport::Concern

  included do
    has_many :spreads, as: :spread_publishable
  end

  module ClassMethods
  end
end
