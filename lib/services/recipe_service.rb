require 'sinatra'
require 'json'


class RecipeService

  def self.connection
    Faraday.new("https://api.spoonacular.com") do |request|
      # request.params['apiKey'] = "fc0a6974411947b4868abf64b921784f"
      request.params['apiKey'] = ENV["RECIPE_KEY"]
    end
  end

  def self.get_recipe_info(id)
    response = connection.get("/recipes/#{id}/information") do |request|
      # request.params['apiKey'] = ENV['recipe_key']
      request.params['includeNutrition'] = true
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_recipe_search(ingredient)
    response = connection.get("/recipes/complexSearch") do |request|
      request.params['includeIngredients'] = "#{ingredient}"
      request.params['instructionsRequired'] = 'true'
      request.params['addRecipeNutrition'] = 'true'
      request.params['number'] = "100"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
