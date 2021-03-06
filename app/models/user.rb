class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
  include Locatable
  has_one :location, -> { where(locatable_type: 'User').order(id: :desc) }, 
                    class_name: 'Location', 
                    foreign_key: :locatable_id

  include LocationConfigurable
  include PostCategoryConfigurable

  include PostPublishable
  include SpreadPublishable
  include CommentPublishable
  include ViewPublishable

  include Activity::Receivable
  include Activity::Sendable
  acts_as_voter

  validates :email, presence: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :gender, presence: true
end
