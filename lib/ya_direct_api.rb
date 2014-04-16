require "net/http"
require "active_support/core_ext"

require 'ya_direct_api/version'
require 'ya_direct_api/gateway'
require 'ya_direct_api/exception'

module Ya
  module Direct
    class Api
      attr_reader :config, :gateway, :env

      def initialize(token, app_id, login, locale = 'en')
        @config = {
          token: token,
          app_id: app_id,
          login: login,
          locale: locale
        }
        @env = resolve_env
        @gateway = Ya::Direct::Gateway.new(@env, @config)
      end

      def method_missing(method_name, args = {})
        @gateway.get_data(method_name.to_s.camelize, args)
      end

      def resolve_env
        ENV['RAILS_ENV'] || 'development'
      end

    end
  end
end
