# encoding: utf-8

module SocialOauthApi
  module Qqdenglu
    class User
      include SocialOauthApi::Base
      include SocialOauthApi::Qqdenglu::Config

      def openid
        @openid ||= get(open_id_url, access_token: access_token)
        @openid.match(/"openid":"(?<openid>\w+)"/)[:openid]
      end

      def user_info
        @user_info ||= JSON.parse(
          get(user_info_url,
              access_token: access_token,
              oauth_consumer_key: client_id,
              openid: openid)
        )
      end

      def nickname
        user_info['nickname']
      end

      def figureurl
        user_info['figureurl']
      end

      alias :id :openid
      alias :name :nickname
      alias :image_url :figureurl
    end
  end
end
