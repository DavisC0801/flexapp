class ClientMealsFacade
  attr_reader :client
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
    weight_logs.map do |log|
      log.weight
    end
  end

  def weight_date
    weight_logs.map do |log|
      log.created_at.to_date.month.to_s + "-" + log.created_at.to_date.day.to_s
    end
  end

  private

  def weight_logs(limit=14)
    @weight_logs ||= @client.recent_weights(limit).reverse
  end

  def meals(limit=5)
    @meals ||= @client.recent_meals(limit)
  end
end
