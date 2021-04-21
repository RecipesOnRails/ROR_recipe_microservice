require 'spec_helper'

RSpec.describe Ingredient do
  it 'makes ingredient object from data' do
    ingredient = {:name=>"Chicken", :amount=>"2 lbs."}

    result = Ingredient.new(ingredient)

    expect(result.class).to eq(Ingredient)
    expect(result.name).to eq("Chicken")
    expect(result.amount).to eq("2 lbs.")
  end
end
