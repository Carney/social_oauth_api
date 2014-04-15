# encoding: utf-8

module SocialOauthApi
  module Qqdenglu
    class User
      include SocialOauthApi::Base
      include SocialOauthApi::Qqdenglu::Config

      def open_id
        @open_id ||= get(open_id_url, access_token: access_token)
        @open_id.match(/"openid":"(?<openid>\w+)"/)[:openid]
      end

      def user_info
        @user_info ||= JSON.parse(
          get(user_info_url,
              access_token: access_token,
              oauth_consumer_key: client_id,
              openid: open_id)
        )
      end

      def nickname
        user_info['nickname']
      end

      def figureurl
        user_info['figureurl']
      end

      alias :id :open_id
      alias :name :nickname
      alias :image_url :figureurl
    end
  end
end