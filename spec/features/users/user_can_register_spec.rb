require 'rails_helper'

RSpec.describe "User login" do
  context "as a visitor who is a trainer" do
    it "can register with an email and password" do
      visit new_trainer_path

      fill_in "First Name", with: "Trainer"
      fill_in "Last Name", with: "Mctrainerton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"

      click_button "Register Account"

      expect(current_path).to eq('/trainer/dashboard')

      trainer = Trainer.last

      expect(trainer.first_name).to eq("Trainer")
      expect(trainer.last_name).to eq("Mctrainerton")
      expect(trainer.email).to eq("mail@example.com")
    end

    it "can't register with missing credentials" do
      visit new_trainer_path

      fill_in "First Name", with: "Trainer"
      fill_in "Last Name", with: "Mctrainerton"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"

      click_button "Register Account"

      expect(current_path).to eq('/register')
      expect(page).to have_content('Missing or Invalid Credentials')
    end
  end

  context "as a visitor who is a client" do
    it "can register with an email, password, and trainer's email" do
      trainer = create(:trainer)
      visit new_user_path

      fill_in "First Name", with: "client"
      fill_in "Last Name", with: "McClienton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"
      fill_in "trainer_email", with: "#{trainer.email}"

      click_button "Register Account"

      expect(current_path).to eq(client_dashboard_path)

      client = Client.last

      expect(client.email).to eq('mail@example.com')
      expect(client.trainer).to eq(trainer)
    end

    it "cannot register without a trainer email" do
      visit new_user_path
      fill_in "First Name", with: "client"
      fill_in "Last Name", with: "McClienton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"
      fill_in "trainer_email", with: "test@test.com"

      click_button "Register Account"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Unable to Find that Trainer. Please Try Again.")
    end
  end
end
