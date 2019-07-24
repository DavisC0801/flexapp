class ClientDashboardFacade
  def initialize(client)
    @client = client
  end

  def meals
    @meals ||= @client.meal_logs.take(5)
  end

  def meal_names
    meals.map do |meal|
      meal.name.capitalize
    end
  end

  def meal_carbs
    meals.map do |meal|
      meal.meal_carbs
    end
  end

  def meal_fats
    meals.map do |meal|
      meal.meal_fats
    end
  end

  def meal_sugars
    meals.map do |meal|
      meal.meal_sugars
    end
  end

  def meal_proteins
    meals.map do |meal|
      meal.meal_protein
    end
  end

end
