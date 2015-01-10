module PostPublishable
  extend ActiveSupport::Concern

  included do
    has_many :posts, as: :post_publishable
  end

  module ClassMethods
  end
end
