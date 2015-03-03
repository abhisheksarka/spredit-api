class Activity < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :sendable, polymorphic: true
  belongs_to :receivable, polymorphic: true
  belongs_to :causable, polymorphic: true

  class << self
    def action_types
      {
        spread: {
          label: 'spread',
          value: 'spread'
        },
        contained: {
          label: 'contained',
          value: 'contained'
        },
        commented: {
          label: 'commented',
          value: 'commented'
        }
      }
    end
  end
end
