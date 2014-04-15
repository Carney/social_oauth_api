# encoding: utf-8

module SocialOauthApi
  module Sinaweibo
    class User
      include SocialOauthApi::Base
      include SocialOauthApi::Sinaweibo::Config

      def uid
        @uid ||= JSON.parse(get(uid_url, access_token: access_token))
        @uid['uid'].to_s
      end

      def show
        @user_info ||= JSON.parse(
          get(show_url, access_token: access_token, uid: uid)
        )
      end

      def screen_name
        show['screen_name']
      end

      def profile_image_url
        show['profile_image_url']
      end

      alias :id :uid
      alias :name :screen_name
      alias :image_url :profile_image_url
      alias :user_info :show
    end
  end
end