class RecipeFacade

  def self.parse_recipe_endpoint(id)
    recipe = RecipeService.get_recipe_info(id)
    memo = {}
    memo[:name] = recipe[:title]
    memo[:image] = recipe[:image]
    memo[:recipe_info] = recipe[:summary]

    require "pry"; binding.pry
    if recipe[:analyzedInstructions] == []
      memo[:instructions]= recipe[:instructions]
    else
      memo[:instructions]= []
      recipe[:analyzedInstructions].first[:steps].map do |step|
        memo[:instructions] << {:step => step[:number], :instruction => step[:step]}
      end
    end

    memo[:ingredients] = Array.new
    recipe[:extendedIngredients].map do |ingredient|
      memo[:ingredients] << {:name =>ingredient[:nameClean], :amount=>"#{ingredient[:amount]} "+"#{ingredient[:unit]}"}
    end

    memo[:nutrients] = Array.new
    recipe[:nutrition][:nutrients].map do |nutrient|
      memo[:nutrients] << {:name =>nutrient[:name], :amount=>"#{nutrient[:amount]} " + "#{nutrient[:unit]}"}
    end
    memo
  end
end
