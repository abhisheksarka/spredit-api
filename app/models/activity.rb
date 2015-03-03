class Activity < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :sendable, polymorphic: true
  belongs_to :receivable, polymorphic: true
  belongs_to :causable, polymorphic: true

  class << self
    def action_types
      {
        spread: {
          label: 'spread'
        },
        contain: {
          label: 'contained'
        },
        commented: {
          label: 'commented'
        }
      }
    end
  end
end
