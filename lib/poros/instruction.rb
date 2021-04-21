class Instruction
  attr_reader :step,
              :instruction

  def initialize(data)
    @step = data[:step]
    @instruction = data[:instruction]
  end
end
