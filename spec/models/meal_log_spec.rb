require "rails_helper"

describe MealLog do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :meal_calories }
    it { should validate_presence_of :meal_fats }
    it { should validate_presence_of :meal_carbs }
    it { should validate_presence_of :meal_protein }
    it { should validate_presence_of :meal_sugars }
    it { should validate_presence_of :meal_sodium }
  end

  describe 'class methods' do

    it ".meal_dates" do
      client = create(:client)

      ml1 = client.meal_logs.create!(name: 'pizza', meal_date: '2019-01-01', meal_time: '11:41:00', meal_calories: 200, meal_fats: 2, meal_carbs: 3, meal_sugars: 5, meal_protein: 10, meal_sodium: 2)
      ml2 = client.meal_logs.create!(name: 'mac n cheese', meal_date: '2019-07-01', meal_time: '11:41:00', meal_calories: 200, meal_fats: 2, meal_carbs: 3, meal_sugars: 5, meal_protein: 10, meal_sodium: 2)
      ml2 = client.meal_logs.create!(name: 'mac n cheese', meal_date: '2019-07-20', meal_time: '11:41:00', meal_calories: 200, meal_fats: 2, meal_carbs: 3, meal_sugars: 5, meal_protein: 10, meal_sodium: 2)
      ml3 = client.meal_logs.create!(name: 'hot dog', meal_date: '2019-07-21', meal_time: '11:41:00', meal_calories: 200, meal_fats: 2, meal_carbs: 3, meal_sugars: 5, meal_protein: 10, meal_sodium: 2)
      ml4 = client.meal_logs.create!(name: 'calzone', meal_date: '2019-07-22', meal_time: '11:41:00', meal_calories: 200, meal_fats: 2, meal_carbs: 3, meal_sugars: 5, meal_protein: 10, meal_sodium: 2)
      ml4 = client.meal_logs.create!(name: 'pasta', meal_date: '2019-07-22', meal_time: '11:41:00', meal_calories: 200, meal_fats: 2, meal_carbs: 3, meal_sugars: 5, meal_protein: 10, meal_sodium: 2)

      dates = client.meal_logs.meals_this_week

      expect(dates).to_not include(ml1)
      expect(dates).to_not include(ml2)
      expect(dates.length).to eq(3)

      first_meal_log = dates.first

      expect(first_meal_log.total_fats).to eq(4)
      expect(first_meal_log.total_sugars).to eq(10)
      expect(first_meal_log.total_protein).to eq(20)
      expect(first_meal_log.total_carbs).to eq(6)
    end
  end
end
