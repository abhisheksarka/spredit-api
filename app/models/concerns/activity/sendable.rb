module Activity::Sendable
  extend ActiveSupport::Concern

  included do
    has_many :sent_activities, as: :sendable, class_name: 'Activity', foreign_key: :sendable_id
  end
end
