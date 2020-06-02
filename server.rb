require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

namespace '/api/v1' do
  before do
    content_type 'application/json'
    ### Here we'll want to delete all park objects
  end
  
  get '/parks' do
    name = params[:name]
    google_response = ParkService.new(name)
    parks = google_response.google_parks
    
    
    
    render json: ParkSerializer.new(Park.all)
  end
end