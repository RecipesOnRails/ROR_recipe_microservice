require 'spec_helper'

RSpec.describe "recipe poro" do
  it 'can create a recipe poro in the facade' do
    VCR.use_cassette("RecipeViewPageInfo") do
      recipe_id = 123
      info = RecipeService.get_recipe_info(recipe_id)

      recipe = Recipe.new(info)

      expect(recipe).to be_a(Recipe)
      expect(recipe.id).to eq(info[:id])
      expect(recipe.name).to eq(info[:title])
      expect(recipe.image).to eq(info[:image])
      expect(recipe.recipe_info).to eq(info[:summary])

      expect(recipe.instructions).to be_an(Array)
      recipe.instructions.each do |instruction|
        expect(instruction).to be_an(Instruction)
      end

      expect(recipe.ingredients).to be_an(Array)
      recipe.ingredients.each do |ingredient|
        expect(ingredient).to be_an(Ingredient)
      end

      expect(recipe.nutrients).to be_an(Array)
      recipe.nutrients.each do |nutrient|
        expect(nutrient).to be_a(Nutrient)
      end
    end
  end

  it 'can create a recipe poro in the facade' do
    # VCR.use_cassette("StringInstructionRecipeViewPageInfo") do
    json_response = File.read('spec/fixtures/webmock/StringInstructionRecipeViewPageInfo.json')
    # stub_request(:get, "https://api.spoonacular.com/recipes/125/information").
    #   to_return(status: 200, body: json_response)
    
      recipe_id = 125
      # info = RecipeService.get_recipe_info(recipe_id)

      info = JSON.parse(json_response, symbolize_names: true)
      recipe = Recipe.new(info)

      expect(recipe).to be_a(Recipe)
      expect(recipe.id).to eq(info[:id])
      expect(recipe.name).to eq(info[:title])
      expect(recipe.image).to eq(info[:image])
      expect(recipe.recipe_info).to eq(info[:summary])

      expect(recipe.instructions).to be_an(Array)
      recipe.instructions.each do |instruction|
        expect(instruction).to be_an(Instruction)
      end

      expect(recipe.ingredients).to be_an(Array)
      recipe.ingredients.each do |ingredient|
        expect(ingredient).to be_an(Ingredient)
      end

      expect(recipe.nutrients).to be_an(Array)
      recipe.nutrients.each do |nutrient|
        expect(nutrient).to be_a(Nutrient)
      end
    # end
  end
end
