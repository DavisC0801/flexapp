class FoodSearchService
  def initialize(search_terms)
    @food = search_terms[:meal_name].downcase
    @size = search_terms[:size].downcase
  end

  def connection
    Faraday.new("https://thawing-lowlands-89167.herokuapp.com")
  end

  def food_lookup
    response = connection.get("/food_info/#{@food}/", {size: @size})
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
