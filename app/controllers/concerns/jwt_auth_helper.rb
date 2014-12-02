require 'jwt'
module JwtAuthHelper
  extend ActiveSupport::Concern

  included do
  end

  # authenticates and sets all the values so that the controller can use it
  def authenticate_token!
    set_jw_token_and_jwt_authable
    if current_jwt_authable.present?
      current_jw_token.update({
        :expires_at => Time.now + JwToken.timeout
      })
    else
      head :unauthorized
    end
  end

  # sign in a user/authable object, returns a json web token object
  def jwt_sign_in(jwt_authable)
    # expire every other token
    jwt_authable.jw_tokens.update_all({
      :expires_at => Time.now
    })
    
    # create a new one
    jwt_authable.jw_tokens.create({
      :value => encode(jwt_authable.id),
      :ip_address => request.ip,
      :expires_at => Time.now + JwToken.timeout
    })
  end

  # should be called only after authentication happens, returns the authable
  # object that has been signed out
  def jwt_sign_out
    current_jw_token.update({
      :expires_at => Time.now
    })
    current_jwt_authable
  end

  # the current_user object
  def current_jwt_authable
    @current_jwt_authable
  end

  # the currently used token
  def current_jw_token
    @current_jw_token
  end

  def encode(jwt_authable_id)
    JWT.encode({ :id => jwt_authable_id }, ENV['JWT_SALT'])
  end

  def decode
    JWT.decode(current_jw_token.value, ENV['JWT_SALT'])
  end

  def decoded_jwt_authable_hash
    decode.first.symbolize_keys
  end

  def current_jwt_authable
    @current_jwt_authable
  end

  def current_jwt_authable=(jwt_authable)
    @current_jwt_authable = jwt_authable
  end

  def current_jw_token=(jw_token)
    @current_jw_token = jw_token
  end

  def current_jw_token_valid?
    current_jw_token.present? and !current_jw_token.expired?
  end

  def set_jw_token_and_jwt_authable
    self.current_jw_token = JwToken.find_by(:value => params[:token])
    if current_jw_token_valid?
      self.current_jwt_authable = JwToken.find_by(:jw_tokenable_id => decoded_jwt_authable_hash[:id]).jw_tokenable
    else
      self.current_jwt_authable = nil
    end
  end

end
