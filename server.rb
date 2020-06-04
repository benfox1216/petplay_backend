require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'
require 'dotenv'
require 'json'
require './lib/park_service'

Dotenv.load('environment_keys.env')

set :port, ENV['PORT']

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end
  
  get '/parks' do
    park_list = ParkService.park_list(request["location"])
    JSON.generate(park_list)
  end
end