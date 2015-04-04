class JwToken < ActiveRecord::Base
  belongs_to :jw_tokenable, polymorphic: true

  def expired?
    Time.now > expires_at
  end

  class << self
    def timeout
      Rails.application.config.jwt[:timeout] rescue default_timeout
    end

    def default_timeout
      1.day
    end
  end
end
