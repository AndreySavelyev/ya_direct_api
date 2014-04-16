require "test_helper"
require 'minitest/autorun'

class YaDirectApiTest < YaDirect::TestCase
  def setup
    @api = Ya::Direct::Api.new('token', 'app_id', 'login', 'ru')
  end

  def test_that_default_env_is_development
    assert_equal "development", @api.env
  end

end
