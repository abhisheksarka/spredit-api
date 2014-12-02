class SessionSerializer < BaseSerializer
  attributes :id, :value, :jw_tokenable

  def jw_tokenable
    object.jw_tokenable
  end
end