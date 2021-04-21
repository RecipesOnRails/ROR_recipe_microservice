require 'spec_helper'

RSpec.describe "instructions poro" do
  it 'can create a instruction poro in the facade' do
    instruction = {:step=>"Step 1", :instruction=>"Do some things"}

    result = Instruction.new(instruction)

    expect(result.class).to eq(Instruction)
    expect(result.step).to eq("Step 1")
    expect(result.instruction).to eq("Do some things")
  end
end
