class SessionSerializer < ApplicationSerializer
  attributes :id, :value, :jw_tokenable, :session_check

  def jw_tokenable
    UserDetailsSerializer.new(object.jw_tokenable, root: false)
  end

  def session_check
  	true
  end
end