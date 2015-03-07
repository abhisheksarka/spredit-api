class BaseSerializer < ActiveModel::Serializer
  def errors
    if object.is_a?(ActiveRecord::Base) and !object.valid?
      object.errors
    end
  end
end
