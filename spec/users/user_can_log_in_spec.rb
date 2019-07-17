require 'rails_helper'

RSpec.describe "User login" do
  context "as a visitor who is a trainer" do
    it "can register with an email and password" do
      visit '/register'
      # save_and_open_page
      fill_in "First Name", with: "Trainer"
      fill_in "Last Name", with: "Mctrainerton"
      fill_in "Email", with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"

      click_on "Create Account"

      expect(current_path).to eq('/dashboard')

      user = User.last

      expect(user.first_name).to eq("Trainer")
      expect(user.last_name).to eq("Mctrainerton")
      expect(user.email).to eq("mail@example.com")
      expect(user.role).to eq(1)
    end
  end
end
