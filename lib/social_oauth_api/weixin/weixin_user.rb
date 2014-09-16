# encoding: utf-8

module SocialOauthApi
  module Weixin
    class User
      include SocialOauthApi::Base
      include SocialOauthApi::Weixin::Config

      def show
        @user_info ||= JSON.parse(
          get(user_info_url,
              access_token: access_token,
              openid: openid)
        )
      end

      def nickname
        show['nickname']
      end

      def headimgurl
        show['headimgurl']
      end

      alias :id :openid
      alias :name :nickname
      alias :image_url :headimgurl
      alias :user_info :show
    end
  end
end
