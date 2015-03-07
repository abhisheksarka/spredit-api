class Activity < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :sendable, polymorphic: true
  belongs_to :receivable, polymorphic: true
  belongs_to :causable, polymorphic: true
  belongs_to :targetable, polymorphic: true

  # for eager loading purposes
  belongs_to :post_targetable, -> { includes(:targeted_activities).where('activities.targetable_type' => 'Post') }, foreign_key: :targetable_id, class_name: :Post

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
