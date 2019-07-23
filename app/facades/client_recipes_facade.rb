class ClientRecipesFacade
  def initialize(meal_plan)
    @meal_plan = meal_plan
  end

  def recipes
    recipe_data = service.recipe_lookup(@meal_plan)
    recipe_data[:recipes].sample(30).map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end

  private

  def service
    FoodSearchService.new
  end
end
