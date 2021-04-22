class RecipeFacade

  def self.parse_recipe_endpoint(id)
    recipe = RecipeService.get_recipe_info(id)
    Recipe.new(recipe)
  end

  def self.parse_search_endpoint(ingredient, diet = nil)
    recipes = RecipeService.get_recipe_search(ingredient, diet)
    recipes[:results].map do |recipe|
      Search.new(recipe)
    end
  end
end
