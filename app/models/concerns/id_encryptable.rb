module IdEncryptable
  extend ActiveSupport::Concern

  included do
    def encrypted_id
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
      crypt.encrypt_and_sign(self.id.to_s)
    end
  end

  module ClassMethods
    def find_by_encrypted_id(encrypted_id)
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
      self.to_s.constantize.find(crypt.decrypt_and_verify(encrypted_id).to_i)
    end
  end
end
