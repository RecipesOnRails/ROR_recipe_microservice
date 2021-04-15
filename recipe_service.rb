require 'sinatra'
require 'json'

get '/' do
  content_type :json
  
  data = {message: 'Hello World!'}
  data.to_json
end
