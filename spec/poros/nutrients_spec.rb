require 'spec_helper'

RSpec.describe Nutrient do
  it 'makes nutrient object from data' do
    nutrient = {:name=>"Calories", :amount=>"384.09 kcal"}

    result = Nutrient.new(nutrient)
    
    expect(result.class).to eq(Nutrient )
    expect(result.name).to eq("Calories")
    expect(result.amount).to eq("384.09 kcal")
  end
end
