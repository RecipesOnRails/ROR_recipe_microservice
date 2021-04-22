require 'spec_helper'

RSpec.describe "search poro" do
  it 'can create a search poro in facade' do
    VCR.use_cassette("recipesearchwithdiet", :allow_playback_repeats => true) do
      ingredient = 'chicken'
      diet = 'gluten free'
      recipe = RecipeService.get_recipe_search(ingredient, diet)
      info = recipe[:results].first

      search = Search.new(info)

      expect(search).to be_a(Search)
      expect(search.id).to eq(info[:id])
      expect(search.title).to eq(info[:title])
      expect(search.image).to eq(info[:image])
      expect(search.cuisine).to eq(info[:cuisines].first)
      expect(search.calories).to eq(info[:nutrition][:nutrients].first[:amount])
    end
  end
end
