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
end
