# encoding: utf-8

module SocialOauthApi
  module Base
    attr_reader :client_id, :provider_type, :access_token

    HTTP_TIMEOUT = 15

    def initialize options
      @client_id     = options[:client_id]
      @provider_type = options[:provider_type]
      @access_token  = options[:access_token]
    end

    def get url, query
      timeout(HTTP_TIMEOUT) do
        uri = URI(url)
        uri.query = URI.encode_www_form(query)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.scheme == 'https'
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        response.body
      end
    end

    class << self
      def klass(str)
        str.split('::').inject(Object) do |mod, class_name|
          mod.const_get(class_name)
        end
      end
    end
  end
end