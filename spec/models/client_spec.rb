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
      ml1 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-01-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
      ml2 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-02-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
      ml3 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-03-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
      ml4 = client.meal_logs.create!(name: 'pizza', meal_date: "2019-04-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)

      expect(client.recent_meals(3)).to eq([ml4,ml3,ml2])
      expect(client.recent_meals(4)).to eq([ml4,ml3,ml2,ml1])
    end

    it "can return recent x weight logs" do
      client = create(:client)
      wl1 = client.weight_logs.create(weight: 10, created_at: "Wed, 24 Jul 2019 21:13:01 UTC +00:00")
      wl2 = client.weight_logs.create(weight: 10, created_at: "Wed, 25 Jul 2019 21:13:01 UTC +00:00")
      wl3 = client.weight_logs.create(weight: 10, created_at: "Wed, 26 Jul 2019 21:13:01 UTC +00:00")
      wl4 = client.weight_logs.create(weight: 10, created_at: "Wed, 27 Jul 2019 21:13:01 UTC +00:00")

      expect(client.recent_weights(3)).to eq([wl1,wl2,wl3])
      expect(client.recent_weights(4)).to eq([wl1,wl2,wl3,wl4])
    end
  end
end
