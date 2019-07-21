require 'rails_helper'

RSpec.describe "As a registered client" do
  describe 'on my dashboard' do
    before :each do
      @client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(@client)
    end

    it "prompts for a weigh in if last log is week old" do
      log1 = @client.weight_logs.create(weight: 123, created_at: Date.today - 8)

      visit client_dashboard_path
      expect(page).to have_content("It has been over a week since you've logged your weight")
      expect(page).to have_link('Log Weight')
    end

    it "doesn't prompt for a weigh if log is current" do
      log1 = @client.weight_logs.create(weight: 123)

      visit client_dashboard_path
      expect(page).to_not have_content("It has been over a week since you've logged your weight")
      expect(page).to have_link('Log Weight')
    end
  end
end
