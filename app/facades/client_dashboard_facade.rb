class ClientDashboardFacade
  def initialize(client)
    @client = client
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

  def weight_amount

  end

  def weight_date

  end

  private

  def weight_logs(limit=14)
    @weight_logs ||= @client.weight_logs.take(limit)
  end

  def meals(limit=5)
    @meals ||= @client.meal_logs.take(limit)
  end
end
