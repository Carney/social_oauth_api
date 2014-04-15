# encoding: utf-8

module SocialOauthApi
  module Sinaweibo
    module Config
      def uid_url
        'https://api.weibo.com/2/account/get_uid.json'
      end

      def show_url
        'https://api.weibo.com/2/users/show.json'
      end
    end
  end
end