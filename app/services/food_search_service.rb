class FoodSearchService
  def connection
    Faraday.new("https://thawing-lowlands-89167.herokuapp.com")
  end

  def food_lookup(search_terms)
    food = search_terms[:meal_name].downcase.sub(" ", "%20")
    size = search_terms[:size].downcase
    response = connection.get("/food_info/#{food}/", {size: size})
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
