class ParkService
  att_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def google_parks
    JSON.parse(response.body, symbolize: true)
  end
  
  private
  
  def response
    uri = "/maps/api/place/findplacefromtext/output?parameters"
    
    'https://maps.googleapis.com'
  end
end