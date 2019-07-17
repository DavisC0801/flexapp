require 'rails_helper'

RSpec.describe "User login" do
  context "as a visitor who is a trainer" do
    it "can register with an email and password" do
      visit trainer_register_path

      fill_in :first_name, with: "Trainer"
      fill_in :last_name, with: "Mctrainerton"
      fill_in :email, with: "mail@example.com"
      fill_in :password, with: "password"
      fill_in :password_confirmation, with: "password"

      click_on "Create Account"

      expect(current_path).to eq(dashboard_path)

      user = User.last

      expect(ApplicationController.current_user).to eq(user)
      expect(user.first_name).to eq("Trainer")
      expect(user.last_name).to eq("Mctrainerton")
      expect(user.email).to eq("mail@example.com")
    end
  end
end
