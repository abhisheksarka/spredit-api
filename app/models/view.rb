class View < ActiveRecord::Base
  belongs_to :viewable, polymorphic: true
  belongs_to :view_publishable, polymorphic: true
end
