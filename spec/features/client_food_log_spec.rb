require "rails_helper"

describe "As a client when I visit my dashboard" do
  it "shows a link labeled Log a Meal" do
    visit dashboard_path
    expect(page).to have_link "Log a Meal"
  end

  it "It links to a place to enter a meal name and portion size" do
    visit dashboard_path
    click_link("Log a Meal")
    expect(current_path).to eq(new_food_log_path)
    fill_in("meal[name_search]", with: "pizza")
    click_button("Large")
    expect(current_path).to eq(new_food_log_path)
  end
end
