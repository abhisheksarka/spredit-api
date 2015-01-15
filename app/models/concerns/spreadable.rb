module Spreadable
  extend ActiveSupport::Concern

  included do
    has_many :spreads, as: :spreadable
  end

  module ClassMethods
  end
end
