require 'rails_helper'

RSpec.describe "sessions spec" do
  context 'as a client' do
    it "can log in" do
      client = create(:client)

      visit '/'

      fill_in 'Email', with: client.email
      fill_in 'Password', with: client.password

      click_on 'Log In'

      expect(page).to have_current_path(client_dashboard_path)
    end
  end

  context "as a trainer" do
    it "can log in" do
      trainer = create(:trainer)

      visit '/'

      fill_in 'Email', with: trainer.email
      fill_in 'Password', with: trainer.password

      click_on 'Log In'

      expect(page).to have_current_path(trainer_dashboard_path)
    end
  end
end
