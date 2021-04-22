class Search
  attr_reader :id,
              :title,
              :image,
              :cuisine,
              :calories

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @image = data[:image]
    @cuisine = data[:cuisine].first
    @calories = new_search_calories(data[:calories])
  end

  def new_search_calories(calories)
    require "pry";binding.pry
    data = get_calories(calories)
    data.map do |calorie|
      Calorie.new(calorie)
    end
  end

  def get_calories(calories)
    calories = []
    calories.map do |calorie|
      calories << recipe[:nutrition][:nutrients].first[:amount]
    end
    calories
  end
end
