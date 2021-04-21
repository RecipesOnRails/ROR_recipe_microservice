require 'spec_helper'

RSpec.describe "Recipes Service" do

  it "can retrive the recipe information endpoint" do

    VCR.use_cassette("RecipeViewPageInfo", :allow_playback_repeats => true) do
      recipe_id = 123
      info = RecipeService.get_recipe_info(recipe_id)

      expect(RecipeService.get_recipe_info(recipe_id)).to be_a(Hash)

    end
  end

  it 'can retrieve a search for recipes that use only an ingredient' do
    VCR.use_cassette("recipesearch") do
      expect(RecipeService.get_recipe_search("chicken")).to be_a(Hash)
    end
  end

  it 'can retrieve a search for recipes that use an ingredient and diet' do
    VCR.use_cassette("recipesearchwithdiet") do
      expect(RecipeService.get_recipe_search("chicken", "gluten free")).to be_a(Hash)
    end
  end
end
