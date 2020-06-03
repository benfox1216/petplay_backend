require_relative 'test_helper'
require './app/services/park_service.rb'

class ParkServiceTest < MiniTest::Test
  def setup
    params = { zipcode: '80202' }
    @service = ParkService.new(params)
    @parks = @service.by_zipcode
  end

  def test_it_exists
    assert_instance_of ParkService, @service
  end

  def test_it_can_get_twenty_nearby_parks
    parks = @service.by_zipcode
    assert_instance_of Hash, parks
    assert_equal 20, parks[:results].count
    assert parks[:results].first[:business_status]
    assert parks[:results].first[:formatted_address]
    assert parks[:results].first[:geometry][:location][:lat]
    assert parks[:results].first[:geometry][:location][:lng]
    assert parks[:results].first[:id]
    assert parks[:results].first[:name]
    assert parks[:results].first[:opening_hours]
    assert parks[:results].first[:photos]
    assert parks[:results].first[:place_id]
    assert parks[:results].first[:plus_code][:compound_code]
    assert parks[:results].first[:plus_code][:global_code]
    assert parks[:results].first[:rating]
    assert parks[:results].first[:reference]
    assert parks[:results].first[:types]
    assert parks[:results].first[:user_ratings_total]
  end
end
