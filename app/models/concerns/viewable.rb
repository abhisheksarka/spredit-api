module Viewable
  extend ActiveSupport::Concern

  included do
    has_many :views, as: :viewable
  end

  module ClassMethods
  end
end
