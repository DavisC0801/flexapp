require 'rails_helper'

RSpec.describe "As a registered Trainer" do
  describe 'on my dashboard' do

    before :each do
      @trainer = create(:trainer)
      @client1 = create(:client, trainer: @trainer)
      @client2 = create(:client, trainer: @trainer)
      allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(@trainer)
    end

    it "allows me to create a clients meal plan" do
      visit trainer_dashboard_path

      click_button "#{@client2.first_name} #{@client2.last_name}"

      click_button "Create Client's Meal Plan"

      fill_in "Calories Per Meal", with: '200'
      fill_in "Excluded", with: 'nuts'
      find(:css, '#vegetarian').click
      find(:css, '#high_protein').click
      click_button "Create Meal Plan"

      expect(current_path).to eq(trainer_client_path(@client2))
      expect(page).to have_content("Successfully created meal plan for #{@client2.first_name} #{@client2.last_name}")

      meal_plan = MealPlan.last

      expect(@client2.meal_plans).to include(meal_plan)
      expect(meal_plan.calories).to eq(200)
      expect(meal_plan.excluded).to eq('nuts')
      expect(meal_plan.vegetarian).to be true
      expect(meal_plan.vegan).to be false
      expect(meal_plan.diet_type).to eq('high_protein')
    end
  end
end
