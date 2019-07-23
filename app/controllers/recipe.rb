class Recipe
  attr_reader :name,
              :url,
              :calories,
              :carbs,
              :protein,
              :img,
              :servings

  def initialize(data)
    @name = data[:name]
    @url = data[:url]
    @calories = data[:calories_per_serving]
    @carbs = data[:carbs_per_serving]
    @protein = data[:protein_per_serving]
    @img = data[:thumbnail]
    @servings = data[:servings]
  end
end
