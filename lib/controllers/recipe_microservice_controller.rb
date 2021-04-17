require 'sinatra'
require 'json'
class RecipeMicroserviceController < Sinatra::Base
  get '/' do
    content_type :json

    data = {message: 'Hello World!'}
    data.to_json
  end
end
