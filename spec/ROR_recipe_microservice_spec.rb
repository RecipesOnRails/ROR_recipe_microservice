require 'spec_helper'
RSpec.describe RecipeMicroserviceController, type: :request do

   it 'returns hello world' do

    get '/'
    body = JSON.parse(last_response.body, symbolize_names: true)
    expect(body[:message]).to eq("Hello World!")
  end

   it 'returns a recipes details' do
      VCR.use_cassette("RecipeViewRequest") do
        get '/api/v1/recipes/12'
        # require 'pry'; binding.pry
        recipe = JSON.parse(last_response.body, symbolize_names: true)
        expect(recipe).to be_a(Hash)

        expect(recipe).to have_key(:data)
        expect(recipe[:data]).to be_a(Hash)

        expect(recipe[:data]).to have_key(:attributes)
        expect(recipe[:data][:attributes]).to have_key(:name)
        expect(recipe[:data][:attributes][:name]).to eq("Roasted Peppers with Boquerones")

        expect(recipe[:data][:attributes]).to have_key(:image)
        expect(recipe[:data][:attributes][:image]).to be_a(String)

        expect(recipe[:data][:attributes]).to have_key(:recipe_info)
        expect(recipe[:data][:attributes][:recipe_info]).to be_a(String)

        expect(recipe[:data][:attributes]).to have_key(:instructions)
        expect(recipe[:data][:attributes][:instructions]).to be_a(Array)
        recipe[:data][:attributes][:instructions].each do |instruction|
          expect(instruction).to have_key(:step)
          expect(instruction[:step]).to be_a(Integer)
          expect(instruction).to have_key(:instruction)
          expect(instruction[:instruction]).to be_a(String)
        end

        expect(recipe[:data][:attributes]).to have_key(:ingredients)
        expect(recipe[:data][:attributes][:ingredients]).to be_a(Array)
        recipe[:data][:attributes][:ingredients].each do |ingredient|
          expect(ingredient).to have_key(:name)
          expect(ingredient[:name]).to be_a(String)
          expect(ingredient).to have_key(:amount)
          expect(ingredient[:amount]).to be_a(String)
        end

        expect(recipe[:data][:attributes]).to have_key(:nutrients)
        expect(recipe[:data][:attributes][:nutrients]).to be_a(Array)
        recipe[:data][:attributes][:nutrients].each do |nutrient|
          expect(nutrient).to have_key(:name)
          expect(nutrient[:name]).to be_a(String)
          expect(nutrient).to have_key(:amount)
          expect(nutrient[:amount]).to be_a(String)
        end
    end
  end
  it 'returns a recipes search' do
    VCR.use_cassette("searchcontroller") do
      get '/api/v1/search/chicken'

      data = JSON.parse(last_response.body, symbolize_names: true)
      expect(data).to be_a(Array)
      data.each do |recipe|
        expect(recipe).to have_key(:title)
        expect(recipe[:title]).to be_a(String)
        expect(recipe).to have_key(:image)
        expect(recipe[:image]).to be_a(String)
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to be_a(Integer)
        expect(recipe).to have_key(:cuisine)
        expect(recipe).to have_key(:calories)
        expect(recipe[:calories]).to be_a(Float)
      end
    end
  end

  it 'returns error when recipe id not found' do
    get '/api/v1/recipes/8'

    expect(last_response.body).to eq("Your recipe could not be found")
    expect(last_response.status).to eq(500)
  end
end
