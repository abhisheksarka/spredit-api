module FbAuthable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def login_via_fb(login_hash)
      find_or_create_entity(login_hash[:userID], login_hash[:accessToken])
    end

    def find_or_create_entity(uid, access_token)
      entity = find_or_create_by(uid: uid, provider: 'facebook')
      me = koala_instance(access_token).get_object('me')
      picture = "https://graph.facebook.com/#{me['id']}/picture"
      entity.update({
        name: me['name'],
        email: me['email'],
        uid: me['id'],
        gender: me['gender'],
        profile_picture: picture,
        profile_picture_medium: "#{picture}?height=100&width=100",
        oauth_token: access_token
      })
      entity
    end

    def koala_instance(access_token)
      Koala::Facebook::API.new(access_token)
    end
  end
end
