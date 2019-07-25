require 'rails_helper'

feature 'trainer show page' do
  before :each do
    @trainer = create(:trainer)
    @client1 = create(:client, trainer: @trainer)
    @client2 = create(:client, trainer: @trainer)
    @client3 = create(:client, trainer: @trainer)
  end

  it 'trainer logs in and sees list of clients' do
    allow_any_instance_of(ApplicationController).to receive(:current_trainer).and_return(@trainer)

    visit '/trainer/dashboard'
    expect(current_path).to eq('/trainer/dashboard')

    within('#clients') do
      within(".client-#{@client1.id}") do
        expect(page).to have_link("#{@client1.first_name} #{@client1.last_name}")
      end
      within(".client-#{@client2.id}") do
        expect(page).to have_link("#{@client2.first_name} #{@client2.last_name}")
      end
      within(".client-#{@client3.id}") do
        expect(page).to have_link("#{@client3.first_name} #{@client3.last_name}")
      end
    end
  end
end
