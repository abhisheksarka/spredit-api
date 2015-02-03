class NotificationValidator < ActiveModel::Validator
  def validate(record)
    if record.sendable == record.receivable
      record.errors[:sendable] << "cannot be same as receivable"
    end
  end
end
