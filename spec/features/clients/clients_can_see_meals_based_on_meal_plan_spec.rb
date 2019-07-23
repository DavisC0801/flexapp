require 'rails_helper'

RSpec.describe "As a registered client" do
  describe 'on my dashboard' do

    before :each do
      @client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(@client)
    end

    it "allows me to see meals based on my meal plan" do
      @client.create_meal_plan(calories: 100, vegetarian: true, diet_type: 'high-protein', excluded: 'nuts')

      visit client_dashboard_path

      click_button "See Trainer Meal Suggestions"

      expect(current_path).to eq(client_recipes_path)

      expect(page).to have_css('.recipe', count: 20)

      within(first('.recipe')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.calories')
        expect(page).to have_css('.carbs')
        expect(page).to have_css('.protein')
        expect(page).to have_css('.servings')
      end
    end

  end
end
