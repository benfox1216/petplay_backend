require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'
require 'dotenv'
Dotenv.load('environment_keys.env')

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

namespace '/api/v1' do
  before do
    content_type 'application/json'
    # Here we'll want to delete all park objects
  end
  
  get '/parks' do
    google_response = ParkService.new(params[:location])
    parks = google_response.google_parks
    
    # Create park objects
    
    render json: ParkSerializer.new(Park.all)
  end
end