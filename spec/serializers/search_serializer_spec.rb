require 'spec_helper'

RSpec.describe 'recipe serializer' do
  it 'serializes a recipe poro' do
    VCR.use_cassette("recipesearchwithdiet") do
      search_poro = RecipeFacade.parse_search_endpoint("chicken", "gluten free")

      serialized = SearchSerializer.new(search_poro)
      search = JSON.parse(serialized.to_json, symbolize_names: true)

      expect(search).to be_a(Hash)
      expect(search).to have_key(:data)
      expect(search[:data]).to be_an(Array)
      search[:data].each do |recipe|
        expect(recipe[:attributes]).to have_key(:id)
        expect(recipe[:attributes][:id]).to be_a(Integer)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a(String)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a(String)
        expect(recipe[:attributes]).to have_key(:cuisine)
        expect(recipe[:attributes]).to have_key(:calories)
        expect(recipe[:attributes][:calories]).to be_a(Float)
      end
    end
  end
end
