# encoding: utf-8

module SocialOauthApi
  class User
    def initialize options
      initialize_provider_user(options)
    end

    def user_info
      @provider_user.user_info
    end

    def id
      @provider_user.id
    end

    def name
      @provider_user.name
    end

    def image_url
      @provider_user.image_url
    end

    def initialize_provider_user options
      provider_type   = options[:provider_type].capitalize
      user_class_name = "SocialOauthApi::#{provider_type}::User"
      @provider_user  = SocialOauthApi::Base.klass(user_class_name).new(options)
    end
  end
end