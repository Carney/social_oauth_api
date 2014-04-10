# encoding: utf-8

module SocialOauthApi
  class Base
    attr_accessor :client_id, :client_secret, :access_token

    def initialize options
      @client_id     = options[:client_id]
      @client_secret = options[:client_secret]
      @access_token  = options[:access_token]
    end

    def get url, query
      uri = URI(url)
      uri.query = URI.encode_www_form(query)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == 'https'
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      response.body
    end
  end
end