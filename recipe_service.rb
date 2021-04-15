require 'sinatra/base'

class RecipeService < Sinatra::Base
  get '/' do
    'Hello World!'
  end
end
