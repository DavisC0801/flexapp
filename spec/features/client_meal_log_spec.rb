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

  it "creates a meal log" do
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
end
