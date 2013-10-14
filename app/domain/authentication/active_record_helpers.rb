module Authentication
  module ActiveRecordHelpers

    def self.include(base)
      base.xtend ClassMethods
    end

    module ClassMethods
      def find_fo_oauth(auth)
        record = where(provider: auth.provider, uid: auth.uid.to_s).first
        record || create(provider: auth.provider, uid: auth.uid,
                          email: auth.info.email, password: Devise.friendly_token[0,20])
      end
    end
  end
end
