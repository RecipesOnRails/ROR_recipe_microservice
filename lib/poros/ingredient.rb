class Ingredient
  attr_reader :name,
              :amount

  def initialize(data)
    @name = data[:name]
    @amount = data[:amount]
  end
end
