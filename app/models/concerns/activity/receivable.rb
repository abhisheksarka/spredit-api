module Activity::Receivable
  extend ActiveSupport::Concern

  included do
    has_many :received_activities, as: :receivable, class_name: 'Activity', foreign_key: :receivable_id
  end
end
