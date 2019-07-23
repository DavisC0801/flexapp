FactoryBot.define do
  factory :meal_plan do
    calories { 200 }
    vegetarian { true }
    client
  end
end
