class Recipe
  attr_reader :id,
              :name,
              :image,
              :recipe_info,
              :instructions,
              :ingredients,
              :nutrients

  def initialize(data)
    @id = data[:id]
    @name = data[:title]
    @image = data[:image]
    @recipe_info = data[:summary]
    @instructions = get_instructions(data[:instructions], data[:analyzedInstructions])
    @ingredients = get_ingredients(data[:extendedIngredients])
    @nutrients = get_nutrients(data[:nutrition][:nutrients])
  end

  def get_instructions(instructions, analyzed_instructions)
    if analyzed_instructions == []
      instructions
    else
      instructions= []
      analyzed_instructions.first[:steps].map do |step|
        instructions << {:step => step[:number], :instruction => step[:step]}
      end
      instructions
    end
  end

  def get_ingredients(extended_ingredients)
    ingredients = []
    extended_ingredients.map do |ingredient|
      ingredients << {:name =>ingredient[:nameClean], :amount=>"#{ingredient[:amount]} "+"#{ingredient[:unit]}"}
    end
    ingredients
  end
  
  def get_nutrients(nutrition)
    nutrients = []
    nutrition.map do |nutrient|
      nutrients << {:name =>nutrient[:name], :amount=>"#{nutrient[:amount]} " + "#{nutrient[:unit]}"}
    end
    nutrients
  end
end