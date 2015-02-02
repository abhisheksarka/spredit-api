module Notification::Receivable
  extend ActiveSupport::Concern

  included do
    has_many :received_notifications, as: :receivable, class_name: 'Notification', foreign_key: :receivable_id
  end

  module ClassMethods
  end
end
