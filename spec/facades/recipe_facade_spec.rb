require 'spec_helper'

RSpec.describe "Recipes Facade" do
  it "can parse the info from recipe information endpoint" do

    VCR.use_cassette("RecipeFacade") do
      recipe_id = 123
      recipe = RecipeFacade.parse_recipe_endpoint(recipe_id)

      expect(recipe).to be_a(Recipe)
      expect(recipe.id).to_not be_nil
      expect(recipe.name).to_not be_nil
      expect(recipe.image).to_not be_nil
      expect(recipe.recipe_info).to_not be_nil
      expect(recipe.instructions).to_not be_nil
      expect(recipe.ingredients).to_not be_nil
      expect(recipe.nutrients).to_not be_nil
    end
  end

  it 'can parse the info from the recipe search endpoint with only ingredient' do
    VCR.use_cassette("recipesearch") do
      data = RecipeFacade.parse_search_endpoint("chicken")

      expect(data).to be_a(Array)
      data.each do |recipe|
        expect(recipe).to be_a(Search)
      end
    end
  end

  it 'can parse the info from the recipe search endpoint with both' do
    VCR.use_cassette("recipesearchwithdiet", :allow_playback_repeats => true) do
      data = RecipeFacade.parse_search_endpoint("chicken", "gluten free")

      expect(data).to be_a(Array)
      data.each do |recipe|
        expect(recipe).to be_a(Search)
      end
    end
  end
end
