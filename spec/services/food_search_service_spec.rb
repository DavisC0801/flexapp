require 'rails_helper'

RSpec.describe FoodSearchService do
  before :each do
    @service = FoodSearchService.new
  end

  it "can search for food" do
    VCR.use_cassette("meal/mac_n_cheese") do
      search_terms = {
        meal_name: 'mac n cheese',
        size: 'large'
      }

      meal_data = @service.food_lookup(search_terms)

      expect(meal_data[:calories]).to eq(752)
      expect(meal_data[:carbs]).to eq(94)
      expect(meal_data[:fats]).to eq(32)
      expect(meal_data[:protein]).to eq(19)
      expect(meal_data[:sodium]).to eq(1338)
      expect(meal_data[:sugars]).to eq(16)
      expect(meal_data[:thumbnail]).to eq("https://d2xdmhkmkbyw75.cloudfront.net/35_thumb.jpg")
      expect(meal_data[:meal]).to eq('mac n cheese')
    end
  end

  it "can look up recipes" do
    meal_plan = create(:meal_plan)

    recipe_data = @service.recipe_lookup(meal_plan)

    expect(recipe_data[:params][:calorie_max]).to eq('200')
    expect(recipe_data[:params][:diet]).to eq('balanced')
    expect(recipe_data[:params][:restriction]).to eq('vegetarian')
    expect(recipe_data[:recipes].count).to eq(100)
    expect(recipe_data[:recipes].first).to have_key(:calories_per_serving)
    expect(recipe_data[:recipes].first).to have_key(:carbs_per_serving)
    expect(recipe_data[:recipes].first).to have_key(:protein_per_serving)
    expect(recipe_data[:recipes].first).to have_key(:servings)
    expect(recipe_data[:recipes].first).to have_key(:thumbnail)
    expect(recipe_data[:recipes].first).to have_key(:url)

  end
end
