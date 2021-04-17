require 'spec_helper'

RSpec.describe "Recipes Service" do
  it "can retrive the recipe information endpoint" do

    VCR.use_cassette("RecipeViewPageInfo") do
      recipe_id = 123
      info = RecipeService.get_recipe_info(recipe_id)

      expect(RecipeService.get_recipe_info(recipe_id)).to be_a(Hash)

    end
  end
end
