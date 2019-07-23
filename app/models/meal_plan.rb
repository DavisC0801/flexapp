class MealPlan < ApplicationRecord
  belongs_to :client

  validates_presence_of :calories, :diet_type
  validates :vegan, inclusion: { in: [ true, false ] }
  validates :vegetarian, inclusion: { in: [ true, false ] }
end
