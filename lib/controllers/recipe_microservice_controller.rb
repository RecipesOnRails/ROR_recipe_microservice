require 'sinatra'
require 'json'
require 'fast_jsonapi'

class RecipeMicroserviceController < Sinatra::Base
set :show_exceptions, false

  get '/' do
    content_type :json

    data = {message: 'Hello World!'}
    data.to_json
  end

  get '/api/v1/recipes/:id' do
    content_type :json

    recipe = RecipeFacade.parse_recipe_endpoint(params["id"])

    body RecipeSerializer.new(recipe).serialized_json
    status 201
  end

  get '/api/v1/search/:ingredient' do
    content_type :json

    data = RecipeFacade.parse_search_endpoint(params[:ingredient])
    data.to_json
  end

  error 400..500 do
    "Your recipe could not be found"
  end
end
