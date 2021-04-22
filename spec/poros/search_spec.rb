require 'spec_helper'

RSpec.describe "search poro" do
  it 'can create a search poro in facade' do
    VCR.use_cassette("recipesearchwithdiet") do
      ingredient = 'chicken'
      diet = 'gluten free'
      info = RecipeService.get_recipe_search(ingredient, diet)

      search = Search.new(info)

      expect(search).to be_a(Search)
    end
  end
end
