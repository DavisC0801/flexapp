require 'rails_helper'

RSpec.describe 'as a registered client' do
  describe 'the dashboard' do

    it "has a section for sending sms messages to trainer if trainer is assigned" do
      trainer = create(:trainer)
      client = create(:client, trainer: trainer)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)

      visit client_dashboard_path

      click_link('Send Trainer Message')

      expect(current_path).to eq(trainer_messages_new_path)

      expect(page).to have_field("Message")
      expect(page).to have_link('Send Message')
    end

    it "doesn't have a section for sending sms messages to trainer if trainer is not assigned" do
      client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)

      visit client_dashboard_path

      expect(page).to_not have_link('Send Trainer Message')
    end
  end
end
