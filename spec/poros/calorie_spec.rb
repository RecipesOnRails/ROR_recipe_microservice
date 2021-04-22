require 'spec_helper'

RSpec.describe Calorie do
  it 'makes calorie object from data' do
    calorie = {:calories=> 521}
#
    result = Calorie.new(calorie)
#
    expect(result.class).to eq(Calorie)
    expect(result.name).to eq("Chicken")
#     expect(result.amount).to eq("2 lbs.")
  end
end
