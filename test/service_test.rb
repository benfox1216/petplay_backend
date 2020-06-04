require_relative 'test_helper'
require 'dotenv'
require './lib/park_service'

class ServiceTest < MiniTest::Test

  def setup
    Dotenv.load('environment_keys.env')
    @park_list = ParkService.park_list('80112')
  end

  def test_it_can_return_formatted_response
    assert_instance_of Array, @park_list
    assert_equal 20, @park_list.count

    @park_list.each do |park|
      assert_instance_of Hash, park
      park.each do |key, value|
        assert_equal value, park[key]
      end
    end
  end
end
