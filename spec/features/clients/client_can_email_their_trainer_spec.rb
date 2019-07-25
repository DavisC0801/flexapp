require 'rails_helper'

RSpec.describe "email invitation" do
  context "as a client" do
    it "can send an email to their trainer" do
      trainer = create(:trainer)
      client = create(:client)
      trainer.clients << client
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
      visit client_dashboard_path
      click_link "Send Trainer E-mail"

      expect(current_path).to eq(client_mailers_new_path)

      fill_in "email", with: 'test'

      expect { click_button 'Send Email' }.to change { ActionMailer::Base.deliveries.count }.by(1)

      expect(current_path).to eq(client_dashboard_path)
      expect(page).to have_content("Email Sent!")
    end
  end
end
