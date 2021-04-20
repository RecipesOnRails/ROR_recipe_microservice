require 'spec_helper'

RSpec.describe 'recipe serializer' do
  it 'serializes a recipe poro' do
    VCR.use_cassette("RecipeViewPageInfo") do
      recipe_id = 123
      recipe_poro = RecipeFacade.parse_recipe_endpoint(recipe_id)

      serialized = RecipeSerializer.new(recipe_poro)
      recipe = JSON.parse(serialized.to_json, symbolize_names: true)

      expect(recipe).to be_a(Hash)
      expect(recipe).to have_key(:data)
      expect(recipe[:data]).to have_key(:id)
      expect(recipe[:data][:id]).to be_a(String)
      expect(recipe[:data]).to have_key(:type)
      expect(recipe[:data][:type]).to be_a(String)
      expect(recipe[:data]).to have_key(:attributes)
      expect(recipe[:data][:attributes]).to be_a(Hash)
      expect(recipe[:data][:attributes]).to have_key(:id)
      expect(recipe[:data][:attributes][:id]).to be_a(Integer)
      expect(recipe[:data][:attributes]).to have_key(:name)
      expect(recipe[:data][:attributes][:name]).to be_a(String)
      expect(recipe[:data][:attributes]).to have_key(:image)
      expect(recipe[:data][:attributes][:image]).to be_a(String)
      expect(recipe[:data][:attributes]).to have_key(:recipe_info)
      expect(recipe[:data][:attributes][:recipe_info]).to be_a(String)

      expect(recipe[:data][:attributes]).to have_key(:instructions)
      expect(recipe[:data][:attributes][:instructions]).to be_an(Array)
      recipe[:data][:attributes][:instructions].each do |instruction|
        expect(instruction).to have_key(:step)
        expect(instruction[:step]).to be_a(Integer)
        expect(instruction).to have_key(:instruction)
        expect(instruction[:instruction]).to be_a(String)
      end

      
      expect(recipe[:data][:attributes]).to have_key(:ingredients)
      expect(recipe[:data][:attributes][:ingredients]).to be_an(Array)
      recipe[:data][:attributes][:ingredients].each do |ingredient|
        expect(ingredient).to have_key(:name)
        expect(ingredient[:name]).to be_a(String)
        expect(ingredient).to have_key(:amount)
        expect(ingredient[:amount]).to be_a(String)
      end

      expect(recipe[:data][:attributes]).to have_key(:nutrients)
      expect(recipe[:data][:attributes][:nutrients]).to be_an(Array)
      recipe[:data][:attributes][:nutrients].each do |nutrient|
        expect(nutrient).to have_key(:name)
        expect(nutrient[:name]).to be_a(String)
        expect(nutrient).to have_key(:amount)
        expect(nutrient[:amount]).to be_a(String)
      end
    end
  end
end