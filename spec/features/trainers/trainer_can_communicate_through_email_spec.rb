require 'rails_helper'

RSpec.describe "email invitation" do
  context "as a trainer" do
    it "can send an email to an existing client" do
      trainer = create(:trainer)
      client = create(:client)
      trainer.clients << client
      allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(trainer)
      visit trainer_dashboard_path
      click_link "#{client.email}"

      expect(current_path).to eq("/trainer_mailers/new.#{client.id}")

      fill_in "email", with: 'test'

      expect { click_button 'Send Email' }.to change { ActionMailer::Base.deliveries.count }.by(1)

      expect(current_path).to eq(trainer_dashboard_path)
      expect(page).to have_content("Email Sent!")
    end
  end
end
