class View < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :viewable, polymorphic: true
  belongs_to :view_publishable, polymorphic: true
  validates_with ViewValidator, on: :create
end
