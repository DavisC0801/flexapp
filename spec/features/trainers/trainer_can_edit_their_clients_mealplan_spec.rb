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
      fill_in 'meal_plan[calories]', with: '200'
      fill_in 'meal_plan[excluded]', with: 'nuts'
      find(:css, '#meal_plan_vegetarian_true').click
      find(:css, '#meal_plan_diet_type_low-carb').click
      click_button "Create Meal Plan"

      expect(current_path).to eq(trainer_client_path(@client2))
      expect(page).to have_content("Successfully created meal plan for #{@client2.first_name} #{@client2.last_name}")

      meal_plan = MealPlan.last

      expect(@client2.meal_plan).to eq(meal_plan)
      expect(meal_plan.calories).to eq(200)
      expect(meal_plan.excluded).to eq('nuts')
      expect(meal_plan.vegetarian).to be true
      expect(meal_plan.vegan).to be false
      expect(meal_plan.diet_type).to eq('low-carb')
    end

    it "allows me to edit a clients meal plan" do
      @client2.create_meal_plan(calories: 180, vegan: true)

      visit trainer_dashboard_path

      click_button "#{@client2.first_name} #{@client2.last_name}"

      click_button "Change Client's Meal Plan"

      fill_in 'meal_plan[calories]', with: '400'
      fill_in 'meal_plan[excluded]', with: ''
      find(:css, '#meal_plan_vegetarian_true').click
      find(:css, '#meal_plan_diet_type_high-protein').click
      click_button "Update Meal Plan"

      expect(current_path).to eq(trainer_client_path(@client2))
      expect(page).to have_content("Successfully updated meal plan for #{@client2.first_name} #{@client2.last_name}")

      meal_plan = MealPlan.last

      expect(meal_plan.calories).to eq(400)
      expect(meal_plan.vegetarian).to be true
      expect(meal_plan.diet_type).to eq('high-protein')
    end

    it "defaults to vegan if both vegetarian and vegan are chosen" do
      visit trainer_dashboard_path

      click_button "#{@client2.first_name} #{@client2.last_name}"

      click_button "Create Client's Meal Plan"

      fill_in 'meal_plan[calories]', with: '200'
      fill_in 'meal_plan[excluded]', with: 'nuts'
      find(:css, '#meal_plan_vegetarian_true').click
      find(:css, '#meal_plan_vegan_true').click
      find(:css, '#meal_plan_diet_type_low-carb').click
      click_button "Create Meal Plan"

      expect(current_path).to eq(trainer_client_path(@client2))
      expect(page).to have_content("Successfully created meal plan for #{@client2.first_name} #{@client2.last_name}")

      meal_plan = MealPlan.last

      expect(meal_plan.vegetarian).to be false
      expect(meal_plan.vegan).to be true
    end

    it "requires calories per day" do
      visit trainer_dashboard_path

      click_button "#{@client2.first_name} #{@client2.last_name}"

      click_button "Create Client's Meal Plan"

      fill_in 'meal_plan[calories]', with: ''
      fill_in 'meal_plan[excluded]', with: 'nuts'
      find(:css, '#meal_plan_vegetarian_true').click
      find(:css, '#meal_plan_vegan_true').click
      find(:css, '#meal_plan_diet_type_low-carb').click
      click_button "Create Meal Plan"

      expect(page).to have_content("Calories can't be blank")

      expect(MealPlan.last).to be nil
    end

  end
end
