module ViewPublishable
  extend ActiveSupport::Concern

  included do
    has_many :viewed, as: :view_publishable, class_name: 'View', foreign_key: :view_publishable_id
  end

  module ClassMethods
  end
end
