require 'sinatra'
require 'json'

class RecipeService

  def self.connection
    Faraday.new("https://api.spoonacular.com") do |request|
      request.params['apiKey'] = "fc0a6974411947b4868abf64b921784f"
      # request.params['apiKey'] = ENV['recipe_key']
    end
  end

  def self.get_recipe_info(id)
    response = connection.get("recipes/#{id}/information") do |request|
      request.params['includeNutrition'] = "true"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
