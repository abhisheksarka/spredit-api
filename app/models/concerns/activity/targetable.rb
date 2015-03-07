module Activity::Targetable
  extend ActiveSupport::Concern

  included do
    has_many :targeted_activities, as: :targetable, class_name: 'Activity', foreign_key: :targetable_id
  end
end
