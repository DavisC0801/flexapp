require "rails_helper"

describe "As a client when I visit my dashboard" do
  it "shows a link labeled Log a Meal" do
    client = create(:client)
    allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
    visit client_dashboard_path
    expect(page).to have_link "Log a Meal"
  end

  it "It links to a place to enter a meal name and portion size" do
    VCR.use_cassette("meal/pizza") do
      client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
      visit client_dashboard_path
      click_link("Log a Meal")
      expect(current_path).to eq(new_meal_logs_path)
      fill_in("meal_input", with: "pizza")
      click_button("Large")
      expect(current_path).to eq(new_meal_logs_path)
    end
  end

  it "creates a meal log using the API" do
    VCR.use_cassette("meal/pizza") do
      client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
      visit new_meal_logs_path
      fill_in("meal_input", with: "pizza")
      click_button("Large")
      click_button("Log Meal")

      test_log = MealLog.last
      expect(test_log.name).to eq("pizza")
      expect(test_log.meal_calories).to eq(569)
      expect(test_log.meal_fats).to eq(20)
      expect(test_log.meal_carbs).to eq(71)
      expect(test_log.meal_sugars).to eq(7)
      expect(test_log.meal_protein).to eq(24)
      expect(test_log.meal_sodium).to eq(1279)
    end
  end

  it "creates a meal log manually" do
    client = create(:client)
    allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
    visit new_meal_logs_path
    fill_in("meal_log[name]", with: "pizza")
    fill_in("meal_log[meal_calories]", with: "1")
    fill_in("meal_log[meal_fats]", with: "2")
    fill_in("meal_log[meal_carbs]", with: "3")
    fill_in("meal_log[meal_sugars]", with: "4")
    fill_in("meal_log[meal_protein]", with: "5")
    fill_in("meal_log[meal_sodium]", with: "6")
    click_button("Log Meal")

    test_log = MealLog.last
    expect(test_log.name).to eq("pizza")
    expect(test_log.meal_calories).to eq(1)
    expect(test_log.meal_fats).to eq(2)
    expect(test_log.meal_carbs).to eq(3)
    expect(test_log.meal_sugars).to eq(4)
    expect(test_log.meal_protein).to eq(5)
    expect(test_log.meal_sodium).to eq(6)
  end

  it "does not create a meal with missing information" do
    client = create(:client)
    allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
    visit new_meal_logs_path
    click_button("Log Meal")

    test_log = MealLog.last
    expect(current_path).to eq(new_meal_logs_path)
    expect(test_log).to be nil
  end

  it "will search for meals with spaces in the name" do
    VCR.use_cassette("meal/pizzabagel") do
      client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
      visit client_dashboard_path
      click_link("Log a Meal")
      expect(current_path).to eq(new_meal_logs_path)
      fill_in("meal_input", with: "pizza bagels")
      click_button("Large")
      expect(current_path).to eq(new_meal_logs_path)
    end
  end
end
