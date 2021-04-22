require 'sinatra'
require 'json'

class RecipeService
  def self.get_recipe_info(id)
    response = connection.get("/recipes/#{id}/information") do |request|
      request.params['includeNutrition'] = true
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_recipe_search(ingredient, diet = nil)
    response = connection.get("/recipes/complexSearch") do |request|
      request.params['includeIngredients'] = "#{ingredient}"
      request.params['instructionsRequired'] = 'true'
      request.params['addRecipeNutrition'] = 'true'
      request.params['number'] = "100"
      request.params['diet'] = "#{diet}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.connection
    Faraday.new("https://api.spoonacular.com") do |request|
      request.params['apiKey'] = ENV["RECIPE_KEY"]
    end
  end
end
