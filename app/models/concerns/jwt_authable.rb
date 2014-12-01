module JwtAuthable
  extend ActiveSupport::Concern

  included do
    has_many :jw_tokens, :as => :jw_tokenable
  end

  module ClassMethods
    
  end
end
