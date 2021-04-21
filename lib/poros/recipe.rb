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
    @instructions = new_recipe_instructions(data[:instructions], data[:analyzedInstructions])
    @ingredients = new_recipe_ingredients(data[:extendedIngredients])
    @nutrients = new_recipe_nutrients(data[:nutrition][:nutrients])
  end

  def new_recipe_instructions(instructions, analyzed_instructions)
    data = get_instructions(instructions, analyzed_instructions)
    data.map do |instruction|
      Instruction.new(instruction)
    end
  end

  def new_recipe_ingredients(extended_ingredients)
    data = get_ingredients(extended_ingredients)
    data.map do |ingredient|
      Ingredient.new(ingredient)
    end
  end

  def new_recipe_nutrients(nutrition)
    data = get_nutrients(nutrition)
    data.map do |nutrient|
      Nutrient.new(nutrient)
    end
  end

  def get_instructions(instructions, analyzed_instructions)
    if analyzed_instructions == []
      instructions
    else
      instructions = []
      analyzed_instructions.first[:steps].each do |step|
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
