class SessionSerializer < BaseSerializer
  attributes :id, :value, :jw_tokenable

  def jw_tokenable
    UserSerializer.new(object.jw_tokenable, root: false)
  end
end