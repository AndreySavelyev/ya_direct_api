require "test_helper"
require 'minitest/autorun'

class GatewayTest < YaDirect::TestCase
  def setup
    @api = Ya::Direct::Api.new('token', 'app_id', 'login', 'ru', :production)
    @sandbox_api = Ya::Direct::Api.new('token', 'app_id', 'login', 'ru')
  end

  def test_gateway_url
    assert_equal "https://soap.direct.yandex.ru/json-api/v4/", @api.gateway.url
  end

  def test_sandbox_gateway_url
    assert_equal "https://api-sandbox.direct.yandex.ru/json-api/v4/", @sandbox_api.gateway.url
  end

end
