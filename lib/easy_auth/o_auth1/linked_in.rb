require 'easy_auth/linked_in/engine'

module EasyAuth
  def self.o_auth1_linked_in_identity_model(controller)
    EasyAuth::Identities::OAuth1::LinkedIn
  end

  module OAuth1::LinkedIn
    extend ActiveSupport::Autoload
    autoload :Controllers
  end

  module Controllers::Sessions
    include EasyAuth::OAuth1::LinkedIn::Controllers::Sessions
  end

  module Models::Identities::OAuth1
    autoload :LinkedIn
  end
end
