module Spreadable
  extend ActiveSupport::Concern

  included do
    has_many :spreads, -> { where action: 'spread' }, as: :spreadable, class_name: 'Spread', foreign_key: :spreadable_id
    has_many :contains, -> { where action: 'contain' }, as: :spreadable, class_name: 'Spread', foreign_key: :spreadable_id
  end

  module ClassMethods
  end
end
