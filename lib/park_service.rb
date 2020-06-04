require 'excon'
require 'json'

class ParkService

  def self.park_list(zipcode)
    raw_response = JSON.parse(response(zipcode).body, symbolize_names: true)[:results]
    
    {parks: raw_response.map do |key, value|
              { :name => key[:name],
                :lat_lng => key[:geometry][:location] }
            end
    }
  end
  
  def self.response(zipcode)
    Excon.post('https://maps.googleapis.com/maps/api/place/textsearch/json',
               query: {
                        key: ENV['GOOGLE_MAPS_API_KEY'],
                        query: "parks+in+#{zipcode}",
                        max_results: '20'
                      })
  end
end
