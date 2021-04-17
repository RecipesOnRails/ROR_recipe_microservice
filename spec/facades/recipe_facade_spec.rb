require 'spec_helper'

RSpec.describe "Recipes Facade" do
  it "can parse the info from recipe information endpoint" do

    VCR.use_cassette("RecipeFacade") do
      recipe_id = 123
      recipe = RecipeFacade.parse_recipe_endpoint(recipe_id)
      expect(recipe).to be_a(Hash)

      expect(recipe).to have_key(:name)
      expect(recipe[:name]).to eq("Tart Green Salad with Avocado Dressing")

      expect(recipe).to have_key(:image)
      expect(recipe[:image]).to be_a(String)

      expect(recipe).to have_key(:recipe_info)
      expect(recipe[:recipe_info]).to be_a(String)

      expect(recipe).to have_key(:instructions)
      expect(recipe[:instructions]).to be_a(Array)
      recipe[:instructions].each do |instruction|
        expect(instruction).to have_key(:step)
        expect(instruction[:step]).to be_a(Integer)
        expect(instruction).to have_key(:instruction)
        expect(instruction[:instruction]).to be_a(String)
      end

      expect(recipe).to have_key(:ingredients)
      expect(recipe[:ingredients]).to be_a(Array)
      recipe[:ingredients].each do |ingredient|
        expect(ingredient).to have_key(:name)
        expect(ingredient[:name]).to be_a(String)
        expect(ingredient).to have_key(:amount)
        expect(ingredient[:amount]).to be_a(String)
      end

      expect(recipe).to have_key(:nutrients)
      expect(recipe[:nutrients]).to be_a(Array)
      recipe[:nutrients].each do |nutrient|
        expect(nutrient).to have_key(:name)
        expect(nutrient[:name]).to be_a(String)
        expect(nutrient).to have_key(:amount)
        expect(nutrient[:amount]).to be_a(String)
      end
    end
  end
end
