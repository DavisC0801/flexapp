require 'rails_helper'

RSpec.describe Client, type: :model do

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :password }
  end

  describe 'validations' do
    it { should have_many :weight_logs }
  end

  describe 'instance methods' do
    it "can return recent x meals" do
      client = create(:client)
      m1 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-01-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
      m2 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-02-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
      m3 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-03-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
      m4 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-04-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)

      expect(client.recent_meals(3)).to eq([m4,m3,m2])
      expect(client.recent_meals(4)).to eq([m4,m3,m2,m1])
    end
  end
end
