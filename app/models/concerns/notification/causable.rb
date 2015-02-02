module Notification::Causable
  extend ActiveSupport::Concern

  included do
    has_many :caused_notifications, as: :causable, class_name: 'Notification', foreign_key: :causable_id
  end

  module ClassMethods
  end
end
