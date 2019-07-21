require 'rails_helper'

RSpec.describe "User login" do
  context "as a visitor who is a trainer" do
    it "can register with an email and password" do
      visit '/register'

      fill_in "First Name", with: "Trainer"
      fill_in "Last Name", with: "Mctrainerton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"

      click_on "Create Account as a Trainer"

      expect(current_path).to eq('/trainer/dashboard')

      trainer = Trainer.last

      expect(trainer.first_name).to eq("Trainer")
      expect(trainer.last_name).to eq("Mctrainerton")
      expect(trainer.email).to eq("mail@example.com")
    end
  end

  context "as a visitor who is a client" do
    it "can register with an email, password, and trainer's email" do
      trainer = create(:trainer)
      visit '/register'

      fill_in "First Name", with: "client"
      fill_in "Last Name", with: "McClienton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"
      fill_in "Trainer's Email(optional)", with: "#{trainer.email}"

      click_on "Register with a Trainer"

      expect(current_path).to eq(client_dashboard_path)

      client = Client.last

      expect(client.email).to eq('mail@example.com')
      expect(client.trainer).to eq(trainer)
    end
  end
end
