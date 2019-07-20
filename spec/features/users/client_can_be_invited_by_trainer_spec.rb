require 'rails_helper'

RSpec.describe "email invitation" do
  context "as a trainer" do
    it "can send an email for a new client to create an account" do
      trainer = create(:trainer)
      allow_any_instance_of(ApplicationController).to recieve(:current_trainer).and_return(trainer)

      visit '/trainer/dashboard'
      expect { click_button "Invite a new client to signup" }.to change { ActionMailer::Base.deliveries.count }.by(1)

      expect(current_path).to eq('/trainer/invite')

      fill_in 'Email', with: 'mail@example.com'
      click_on 'Invite'

      expect(current_path).to eq('/trainer/dashboard')
    end
  end
end
