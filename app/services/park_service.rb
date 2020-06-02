require 'excon'
require 'json'

class ParkService
  attr_reader :by_zipcode

  def initialize(params)
    @origin = params[:zipcode]
    @by_zipcode = get_nearby_parks
  end

  def get_nearby_parks
    fetch_parks_by_zipcode
  end

  private

  def fetch_parks_by_zipcode
    repackaged_hash_response
  end

  def repackaged_hash_response
    { results: parsed_json[:results] }
  end

  def parsed_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def response
    Excon.post('https://maps.googleapis.com/maps/api/place/textsearch/json',
               query: {
                        key: ENV["GOOGLE_MAPS_API_KEY"],
                        query: "parks+in+#{@origin}",
                        max_results: '20'
                      })
  end
end
