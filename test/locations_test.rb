# require_relative 'test_helper'
# require 'dotenv'
# # require './lib/locations'
# require './lib/park_service'
# class LocationsTest < MiniTest::Test
#   def setup
    # Dotenv.load('environment_keys.env')
  #   params = { zipcode: '80202' }
  #   @locations = Locations.new(params)
  #   @response = @locations.nearby
  # end

  # def test_it_exists
  #   assert_instance_of Locations, @locations
  # end

  # def test_it_can_return_twenty_nearby_parks
    # assert_instance_of String, @response
    # park_list = ParkService.park_list('80112')

    # # parsed = JSON.parse(@response, symbolize_names: true)
    # binding.pry
    #
    # assert_instance_of Hash, parsed
    # assert_equal 20, parsed[:results].count
    # assert parsed[:results].first[:business_status]
    # assert parsed[:results].first[:formatted_address]
    # assert parsed[:results].first[:geometry][:location][:lat]
    # assert parsed[:results].first[:geometry][:location][:lng]
    # assert parsed[:results].first[:id]
    # assert parsed[:results].first[:name]
    # assert parsed[:results].first[:opening_hours]
    # assert parsed[:results].first[:photos]
    # assert parsed[:results].first[:place_id]
    # assert parsed[:results].first[:plus_code][:compound_code]
    # assert parsed[:results].first[:plus_code][:global_code]
    # assert parsed[:results].first[:rating]
    # assert parsed[:results].first[:reference]
    # assert parsed[:results].first[:types]
    # assert parsed[:results].first[:user_ratings_total]
#   end
# end
