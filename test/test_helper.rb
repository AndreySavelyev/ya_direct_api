require 'bundler/setup'

require 'ya_direct_api'

require 'minitest/unit'
require "minitest/autorun"
require 'minitest/pride'

Bundler.require

module YaDirect
  class TestCase < MiniTest::Unit::TestCase
  end
end
