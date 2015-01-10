module Postable
  extend ActiveSupport::Concern

  included do
    has_one :post, as: :postable
  end

  module ClassMethods
  end
end
