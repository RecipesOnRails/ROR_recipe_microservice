require 'sinatra'
require 'json'
class RecipeMicroserviceController < Sinatra::Base
  get '/' do
    content_type :json

    data = {message: 'Hello World!'}
    data.to_json
  end

  get '/api/v1/recipes/:id' do
    content_type :json

    data = RecipeFacade.parse_recipe_endpoint(params["id"])
    data.to_json
    #render json reciepeSerializer.new(recipe)
  end

  get '/api/v1/search/:ingredient' do
    content_type :json

    data = RecipeFacade.parse_search_endpoint(params[:ingredient])
    data.to_json
  end
end
