class ClientMealsFacade
  attr_reader :client
  def initialize(client)
    @client = client
  end

  def meal_dates
    meals.map do |meal|
      meal.meal_date.to_date.month.to_s + '-' + meal.meal_date.to_date.day.to_s
    end
  end

  def meal_carbs
    meals.map do |meal|
      meal.total_carbs
    end
  end

  def meal_fats
    meals.map do |meal|
      meal.total_fats
    end
  end

  def meal_sugars
    meals.map do |meal|
      meal.total_sugars
    end
  end

  def meal_proteins
    meals.map do |meal|
      meal.total_protein
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

  def meal_plan
    @meal_plan ||= @client.meal_plan
  end

  private

  def weight_logs(limit=14)
    @weight_logs ||= @client.recent_weights(limit).reverse
  end

  def meals
    @meals ||= @client.meal_logs.meals_this_week
  end
end
