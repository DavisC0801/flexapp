require 'rails_helper'

RSpec.describe "As a registered client" do
  describe 'on my dashboard' do

    before :each do
      @client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(@client)
    end

    it "allows me to log my weight whenever I would like" do
      visit client_dashboard_path

      click_link "Log Weight"

      expect(current_path).to eq(weight_logs_new_path)

      fill_in 'Weight', with: '210'
      click_button "Log Weight"

      expect(current_path).to eq(client_dashboard_path)
      expect(page).to have_content('Successfully Logged Weight')
    end

    it "requires input to create log" do
      visit client_dashboard_path

      click_link "Log Weight"

      expect(current_path).to eq(weight_logs_new_path)

      fill_in 'Weight', with: ''
      click_button "Log Weight"

      expect(current_path).to eq(weight_logs_path)
      expect(page).to have_content("Weight can't be blank")
    end
  end
end
