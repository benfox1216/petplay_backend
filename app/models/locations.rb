require './services/park_service'
require 'json'

class Locations
  attr_reader :nearby

  def initialize(params)
    @params = params
    @nearby = get_nearby_locations
  end

  def get_nearby_locations
    service = ParkService.new(@params)
    nearby_parks = service.by_zipcode
    JSON.pretty_generate(nearby_parks)
  end
end
