require 'rails_helper'

feature 'trainer client show page' do
  before :each do
    @trainer = create(:trainer)
    @client = create(:client, trainer: @trainer)
  end

  it 'trainer sees single client card' do
    # As a Trainer
    allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(@trainer)
    # When I visit "trainer/dashboard"
    visit 'trainer/dashboard'
    expect(current_path).to eq('/trainer/dashboard')
    # And I click on a client's card
    click_on "#{@client.first_name} #{@client.last_name}"
    # I am taken to that clients show page - "clients/id"
    expect(current_path).to eq("/trainer/clients/#{@client.id}")

    expect(page).to have_content("#{@client.first_name.capitalize} #{@client.last_name.capitalize}")
    expect(page).to have_button("Create Client's Meal Plan")

    click_on "Back To Trainer's Client List"
    expect(current_path).to eq('/trainer/dashboard')
  end
end
