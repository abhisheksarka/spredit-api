class View < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :viewable, polymorphic: true
  belongs_to :view_publishable, polymorphic: true
  validates_with ViewValidator, on: :create
  after_save :update_counter_cache
  
  def update_counter_cache
    viewable.update(views_count: viewable.views.length)
  end
end
