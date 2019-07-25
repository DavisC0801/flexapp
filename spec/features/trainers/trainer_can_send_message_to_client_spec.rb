require 'rails_helper'

feature 'trainer client show page' do
  before :each do
    @trainer = create(:trainer)
    @client = create(:client, trainer: @trainer, phone_num: "5715943614")
    @client_no_phone_num = create(:client, trainer: @trainer, phone_num: nil)
  end

  it 'trainer can send sms message to client' do
    VCR.use_cassette("message/create2") do
      allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(@trainer)

      visit 'trainer/dashboard'
      expect(current_path).to eq ('/trainer/dashboard')

      click_on "#{@client.first_name} #{@client.last_name}"
      expect(current_path).to eq("/trainer/clients/#{@client.id}")

      expect(page).to have_button("Send Message to Client")
      click_button "Send Message to Client"

      expect(current_path).to eq("/trainer/client_messages/new.#{@client.id}")

      fill_in "Message", with: "HELLO #{@client.first_name}, LETS GET FIT!!!"
      click_button 'Send Message'

      expect(current_path).to eq(trainer_dashboard_path)
      expect(page).to have_content('Successfully Sent Message')
    end
  end

  it 'trainer cannot send sms to client with no phone number' do
    allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(@trainer)

    visit 'trainer/dashboard'
    expect(current_path).to eq ('/trainer/dashboard')

    click_on "#{@client_no_phone_num.first_name} #{@client_no_phone_num.last_name}"
    expect(current_path).to eq("/trainer/clients/#{@client_no_phone_num.id}")

    expect(page).to_not have_button("Send Message to Client")
  end
end
