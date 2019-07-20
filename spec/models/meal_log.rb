require "rails_helper"

describe MealLog do
  it { should validate_presence_of :name }
  it { should validate_presence_of :meal_calories }
  it { should validate_presence_of :meal_fats }
  it { should validate_presence_of :meal_carbs }
  it { should validate_presence_of :meal_protein }
  it { should validate_presence_of :meal_sugars }
  it { should validate_presence_of :meal_sodium }
end
