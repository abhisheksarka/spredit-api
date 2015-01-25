class ViewValidator < ActiveModel::Validator
  def validate(record)
    if View.find_by(view_publishable_id: record.view_publishable_id, viewable_id: record.viewable_id).present?
      record.errors[:view_publishable] << "has already viewed the viewable"
    end
  end
end
