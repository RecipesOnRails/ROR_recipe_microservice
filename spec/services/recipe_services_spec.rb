require 'spec_helper'

RSpec.describe "Recipes Service" do

  it "can retrive the recipe information endpoint" do

    VCR.use_cassette("RecipeViewPageInfo", :allow_playback_repeats => true) do
      recipe_id = 123
      info = RecipeService.get_recipe_info(recipe_id)

      expect(info).to be_a(Hash)
      expect(info).to have_key(:id)
      expect(info).to have_key(:title)
      expect(info).to have_key(:image)
      expect(info).to have_key(:summary)
      expect(info).to have_key(:instructions)
      expect(info).to have_key(:analyzedInstructions)
      expect(info).to have_key(:extendedIngredients)
    end
  end

  it 'can retrieve a search for recipes that use only an ingredient' do
    VCR.use_cassette("recipesearch") do
      info = RecipeService.get_recipe_search("chicken")

      expect(info).to be_a(Hash)
      expect(info).to have_key(:results)
      expect(info[:results]).to be_an(Array)
      expect(info[:results].first).to have_key(:id)
      expect(info[:results].first).to have_key(:title)
      expect(info[:results].first).to have_key(:image)
      expect(info[:results].first).to have_key(:cuisines)
      expect(info[:results].first).to have_key(:nutrition)
      expect(info[:results].first[:nutrition]).to have_key(:nutrients)
      expect(info[:results].first[:nutrition][:nutrients].first).to have_key(:amount)
    end
  end

  it 'can retrieve a search for recipes that use an ingredient and diet' do
    VCR.use_cassette("recipesearchwithdiet") do
      info = RecipeService.get_recipe_search("chicken", "gluten free")

      expect(info).to be_a(Hash)
      expect(info).to have_key(:results)
      expect(info[:results]).to be_an(Array)
      expect(info[:results].first).to have_key(:id)
      expect(info[:results].first).to have_key(:title)
      expect(info[:results].first).to have_key(:image)
      expect(info[:results].first).to have_key(:cuisines)
      expect(info[:results].first).to have_key(:nutrition)
      expect(info[:results].first[:nutrition]).to have_key(:nutrients)
      expect(info[:results].first[:nutrition][:nutrients].first).to have_key(:amount)
    end
  end
end
