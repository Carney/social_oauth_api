# encoding: utf-8

module SocialOauthApi
  module Qqdenglu
    module Config
      def open_id_url
        'https://graph.qq.com/oauth2.0/me'
      end

      def user_info_url
        'https://graph.qq.com/user/get_user_info'
      end
    end
  end
end