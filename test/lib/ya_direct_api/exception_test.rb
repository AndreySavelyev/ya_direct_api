require "test_helper"
require 'minitest/autorun'

class ExceptionTest < YaDirect::TestCase
  def setup
    @api = Ya::Direct::Api.new('token', 'app_id', 'login', 'ru')
    @error_string = {"error_detail"=>"", "error_str"=>"Invalid request", "error_code"=>'0'}.to_json.to_s
  end

  def test_exception_getting
    assert_raises Ya::Direct::Exception do
      @api.gateway.stub(:request, @error_string) do
        @api.get_campaigns_list
      end
    end
  end

end
