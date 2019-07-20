require 'rails_helper'

RSpec.describe "email invitation" do
  context "as a trainer" do
    it "can send an email for a new client to create an account" do
      trainer = create(:trainer)
      allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(trainer)

      visit '/trainer/dashboard'
      click_link "Invite a new client to signup"

      expect(current_path).to eq('/trainer/invite')

      fill_in "email[Client Email]", with: 'mail@example.com'

      expect { click_button 'Invite' }.to change { ActionMailer::Base.deliveries.count }.by(1)

      expect(current_path).to eq('/trainer/dashboard')
      expect(page).to have_content("Email Sent!")
    end
  end

  context "as a client" do
    it "can go to the link in the email and signup" do
      trainer = create(:trainer)
      trainer2 = create(:trainer)

      visit register_through_trainer_path(trainer)
 
      fill_in "First Name", with: "Trainer"
      fill_in "Last Name", with: "Mctrainerton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"

      click_on "Register with a Trainer"

      expect(current_path).to eq('/dashboard')

      client = Client.last

      expect(client.email).to eq('mail@example.com')
      expect(client.trainer).to eq(trainer)
    end
  end
end
