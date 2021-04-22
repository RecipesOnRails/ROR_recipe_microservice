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
    @cuisine = data[:cuisines].first
    @calories = data[:nutrition][:nutrients].first[:amount]
  end
end
