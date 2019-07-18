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

  context "as a visitor who is a client" do
    it "can register for the app by searching a trainer's email" do
      trainer = User.create(first_name: "Trainer", last_name: "Mctrainerton", email: "mail@example.com", password_digest: "q", role: 1)
      visit '/register'

      expect(page).to have_content("If your trainer sent you to sign up, click Here")
      click_link "Here"

      expect(current_path).to eq('/register/client')

      fill_in "First Name", with: "Client"
      fill_in "Last Name", with: "McClienton"
      fill_in "Email", with: "client@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm your Password", with: "password"
      fill_in "Trainer's Email", with: "mail@example.com"

      click_on "Create Account"

      expect(current_path).to eq('/dashboard')

      client = User.last

      expect(client.first_name).to eq("Client")
      expect(client.last_name).to eq("McClienton")
      expect(client.email).to eq("client@example.com")
      expect(client.role).to eq(0)
      expect(trainer.clients.first).to eq(client)
    end
  end
end
