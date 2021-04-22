class Calorie
  attr_reader :calories

  def initialize(data)
    @calories = data[:calories]
  end
end
