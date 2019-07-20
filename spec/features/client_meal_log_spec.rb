require "rails_helper"

describe "As a client when I visit my dashboard" do
  it "shows a link labeled Log a Meal" do
    visit dashboard_path
    expect(page).to have_link "Log a Meal"
  end

  it "It links to a place to enter a meal name and portion size" do
    VCR.use_cassette("meal/pizza") do
      visit dashboard_path
      click_link("Log a Meal")
      expect(current_path).to eq(new_meal_logs_path)
      fill_in("meal_input", with: "pizza")
      click_button("Large")
      expect(current_path).to eq(new_meal_logs_path)
      # expect(page).to have_css("value=284")
    end
  end

  it "creates a meal log using the API" do
    VCR.use_cassette("meal/pizza") do
      visit new_meal_logs_path
      fill_in("meal_input", with: "pizza")
      click_button("Large")
      click_button("Log Meal")

      test_log = MealLog.last
      expect(test_log.name).to eq("pizza")
      expect(test_log.meal_calories).to eq(284)
      expect(test_log.meal_fats).to eq(10)
      expect(test_log.meal_carbs).to eq(35)
      expect(test_log.meal_sugars).to eq(7)
      expect(test_log.meal_protein).to eq(12)
      expect(test_log.meal_sodium).to eq(639)
    end
  end

  it "creates a meal log manually" do
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
    visit new_meal_logs_path
    click_button("Log Meal")

    test_log = MealLog.last
    expect(current_path).to eq(new_meal_logs_path)
    expect(test_log).to be nil
  end
end
