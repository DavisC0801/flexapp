class MealLog < ApplicationRecord
  validates_presence_of :name, :meal_calories, :meal_fats, :meal_carbs, :meal_protein, :meal_sugars, :meal_sodium

  belongs_to :client

  default_scope { order(meal_date: :desc) }
end
