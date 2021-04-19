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
        expect(instruction).to have_key(:step)
        expect(instruction[:step]).to be_a(Integer)
        expect(instruction).to have_key(:instruction)
        expect(instruction[:instruction]).to be_a(String)
      end

      expect(recipe.ingredients).to be_an(Array)
      recipe.ingredients.each do |ingredient|
        expect(ingredient).to have_key(:name)
        expect(ingredient[:name]).to be_a(String)
        expect(ingredient).to have_key(:amount)
        expect(ingredient[:amount]).to be_a(String)
      end

      expect(recipe.nutrients).to be_a(Array)
      recipe.nutrients.each do |nutrient|
        expect(nutrient).to have_key(:name)
        expect(nutrient[:name]).to be_a(String)
        expect(nutrient).to have_key(:amount)
        expect(nutrient[:amount]).to be_a(String)
      end
    end
  end
end