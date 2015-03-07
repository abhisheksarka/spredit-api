class SpreadValidator < ActiveModel::Validator
  def validate(record)
    if Spread.find_by(spread_publishable_id: record.spread_publishable_id, spreadable_id: record.spreadable_id).present?
      record.errors[:spread_publishable] << "Already spread/contained by you."
    end
  end
end
