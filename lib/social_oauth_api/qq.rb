# encoding: utf-8

module SocialOauthApi
  module Qq
    class User < Base
      OPENID_URL = 'https://graph.qq.com/oauth2.0/me'
      USER_INFO_URL = 'https://graph.qq.com/user/get_user_info'

      def default_query
        { oauth_consumer_key: client_id, access_token: access_token }
      end

      def open_id
        @open_id ||= get(OPENID_URL, default_query)
        @open_id.match(/"openid":"(?<openid>\w+)"/)[:openid]
      end

      def user_info
        @user_info ||= JSON.parse(get(USER_INFO_URL, default_query.merge(openid: open_id)))
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