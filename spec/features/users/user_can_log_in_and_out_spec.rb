require 'rails_helper'

RSpec.describe "sessions spec" do
  context 'as a client' do
    it "can log in and out" do
      client = create(:client)

      visit '/'

      fill_in 'Email', with: client.email
      fill_in 'Password', with: client.password

      click_on 'Log In'

      expect(page).to have_current_path(client_dashboard_path)
      expect(page).to have_link("Logout")
      expect(page).to have_link("Profile")

      visit '/register'

      expect(page).to have_link("Profile")
      click_link("Logout")

      expect(current_path).to eq('/')

      visit client_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end

    it "can't log in without proper credentials" do
      visit '/'

      fill_in 'Email', with: 'mail@example.com'

      click_on 'Log In'

      expect(current_path).to eq('/')
      expect(page).to have_content("Invalid Email")
    end

    it "can't log in without a proper password" do
      client = create(:client)

      visit '/'

      fill_in 'Email', with: client.email
      fill_in 'Password', with: 'ewnviauwn'

      click_on 'Log In'

      expect(current_path).to eq('/')
      expect(page).to have_content("Invalid Username/Password Combination!")
    end
  end

  context "as a trainer" do
    it "can log in and out" do
      trainer = create(:trainer)

      visit '/'

      fill_in 'Email', with: trainer.email
      fill_in 'Password', with: trainer.password

      click_on 'Log In'

      expect(page).to have_current_path(trainer_dashboard_path)
      expect(page).to have_link("Logout")
      expect(page).to have_link("Profile")

      visit '/register'

      expect(page).to have_link("Profile")
      click_link("Logout")

      expect(current_path).to eq('/')

      visit trainer_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
