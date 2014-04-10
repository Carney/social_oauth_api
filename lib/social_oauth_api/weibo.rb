# encoding: utf-8

module SocialOauthApi
  module Weibo
    class User < Base
      UID_URL  = 'https://api.weibo.com/2/account/get_uid.json'
      SHOW_URL = 'https://api.weibo.com/2/users/show.json'

      def default_query
        { source: client_id, access_token: access_token }
      end

      def uid
        @uid ||= JSON.parse(get(UID_URL, default_query))
        @uid['uid'].to_s
      end

      def show
        @user_info ||= JSON.parse(get(SHOW_URL, default_query.merge(uid: uid)))
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
    end
  end
end