class RecipeFacade

  def self.parse_recipe_endpoint(id)
    recipe = RecipeService.get_recipe_info(id)
    Recipe.new(recipe)
  end

  def self.parse_search_endpoint(ingredient, diet = nil)
    recipes = RecipeService.get_recipe_search(ingredient)
    Search.new(recipes)
    # memo = []
    # recipes[:results].each do |recipe|
    #   details = {}
    #   details[:title] = recipe[:title]
    #   details[:image] = recipe[:image]
    #   details[:id] = recipe[:id]
    #   details[:cuisine] = recipe[:cuisines].first
    #   details[:calories] = recipe[:nutrition][:nutrients].first[:amount]
    #   memo << details
    # end
    # memo
  end
end
