require 'rails_helper'

RSpec.describe 'as a registered client' do
  describe 'the dashboard' do

    it "can send sms messages to trainer if trainer is assigned" do
      VCR.use_cassette("message/create") do
        trainer = create(:trainer, phone_num: '3034351644')
        client = create(:client, trainer: trainer)
        allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)

        visit client_dashboard_path

        click_link('Message Trainer')

        expect(current_path).to eq(trainer_messages_new_path)

        fill_in "Message", with: "HI TRAINER!"
        click_button 'Send Message'

        expect(current_path).to eq(client_dashboard_path)
        expect(page).to have_content('Successfully Sent Message')
      end
    end

    it "doesn't have a section for sending sms messages to trainer if trainer is not assigned" do
      client = create(:client)
      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)

      visit client_dashboard_path

      expect(page).to_not have_link('Send Trainer Message')
    end

    it "doesn't have a section for sending sms messages to trainer if trainer does not have number associated" do
      trainer = create(:trainer, phone_num: nil)
      client = create(:client, trainer: trainer)

      allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)

      visit client_dashboard_path

      expect(page).to_not have_link('Send Trainer Message')
    end
  end
end
