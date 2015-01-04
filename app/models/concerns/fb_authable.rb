module FbAuthable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def login_via_fb(login_hash)
      find_or_create_entity(login_hash[:userID], login_hash[:accessToken])
    end

    def find_or_create_entity(uid, access_token)
      entity = find_by(:uid => uid)
      if !entity.present?
        me = koala_instance(access_token).get_object('me')
        entity = create({
          :provider => 'facebook',
          :name => me['name'],
          :email => me['email'],
          :uid => me['id'],
          :gender => me['gender'],
          :profile_picture => "https://graph.facebook.com/#{me['id']}/picture"
        })
      end
      entity.update({:oauth_token => access_token})
      entity
    end

    def koala_instance(access_token)
      Koala::Facebook::API.new(access_token)
    end
  end
end
