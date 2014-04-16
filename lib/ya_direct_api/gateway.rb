module Ya
  module Direct
    class Gateway
      attr_reader :url

      URLS = {
        production: "https://soap.direct.yandex.ru/json-api/v4/",
        sandbox: "https://api-sandbox.direct.yandex.ru/json-api/v4/"
      }

      def initialize(env, config, mode)
        @url = URLS[mode]
        @config = config
      end

      def request_options(method, params)
        {
          locale: @config[:locale],
          login: @config[:login],
          application_id: @config[:app_id],
          token: @config[:token],
          method: method
        }.merge(params)
      end

      def request(method, params)
        url = URI.parse(@url)

        request = Net::HTTP::Post.new(url.path, initheader = {'Content-Type' =>'application/json'})
        request.body = request_options(method, params).to_json

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        response = http.request(request)

        if response.kind_of? Net::HTTPSuccess
          return response.body
        else
          raise response.inspect
        end
      end

      def get_data(method, params)
        response = request(method, params)
        parsed_response = JSON.parse(response)
        validate_response!(parsed_response)
        parsed_response
      end

      def validate_response!(response)
        if response.has_key?('error_code')
          raise Ya::Direct::Exception.new(response['error_detail'], response['error_str'], response['error_code'])
        end
      end

    end
  end
end
