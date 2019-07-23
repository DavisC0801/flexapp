class FoodSearchService

  def food_lookup(search_terms)
    food = search_terms[:meal_name].downcase.gsub(" ", "%20")
    size = search_terms[:size].downcase
    response = connection.get("/food_info/#{food}/", {size: size})
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def recipe_lookup(meal_plan)
    restriction = ''
    if meal_plan.vegan
      restriction = 'vegan'
    elsif meal_plan.vegetarian
      restriction = 'vegetarian'
    end
    response = connection.get("/meals?calories=#{meal_plan.calories}&restriction=#{restriction}&diet_type=#{meal_plan.diet_type}&excluded=#{meal_plan.excluded}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new("https://thawing-lowlands-89167.herokuapp.com")
  end
end
