class ParkService
  att_reader :location
  
  def initialize(location)
    @location = location
  end
  
  def google_parks
    JSON.parse(response.body, symbolize: true)
  end
  
  private
  
  def response
    key = ENV[GOOGLE_API_KEY]
    params = "input=#{@location}&inputtype=textquery&key=#{key}"
    
    uri = "/maps/api/place/findplacefromtext/json?#{params}"
    Faraday.get("https://maps.googleapis.com/#{uri}")
  end
end