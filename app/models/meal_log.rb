class MealLog < ApplicationRecord
  validates_presence_of :name, :meal_calories, :meal_fats, :meal_carbs, :meal_protein, :meal_sugars, :meal_sodium

  belongs_to :client

  default_scope { order(meal_date: :desc) }

  def self.meals_this_week
    where(meal_date: [(Date.today - 7)..Date.today])
        .select('SUM(meal_logs.meal_fats) AS total_fats')
        .select('SUM(meal_logs.meal_sugars) AS total_sugars')
        .select('SUM(meal_logs.meal_protein) AS total_protein')
        .select('SUM(meal_logs.meal_carbs) AS total_carbs')
        .select(:meal_date)
        .group(:meal_date)
  end
end
