module Notification::Sendable
  extend ActiveSupport::Concern

  included do
    has_many :sent_notifications, as: :sendable, class_name: 'Notification', foreign_key: :sendable_id
  end

  module ClassMethods
  end
end
