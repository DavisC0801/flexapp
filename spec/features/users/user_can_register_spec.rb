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
  end
end
