require 'rails_helper'

feature 'trainer can see list of clients' do
  before :each do
    @trainer = create(:trainer)
    @client1 = create(:client, trainer: @trainer)
    @client2 = create(:client, trainer: @trainer)
    @client3 = create(:client, trainer: @trainer)
  end

  it 'user logs in and sees list of clients' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@trainer)

    visit '/trainer/dashboard'
    expect(current_path).to eq('/trainer/dashboard')

    within('#clients') do
      within(".client-#{@client1.id}") do
        expect(page).to have_content("#{@client1.first_name} #{@client1.last_name}")
        expect(page).to have_content("#{@client1.email}")
      end
      within(".client-#{@client2.id}") do
        expect(page).to have_content("#{@client2.first_name} #{@client2.last_name}")
        expect(page).to have_content("#{@client2.email}")
      end
      within(".client-#{@client3.id}") do
        expect(page).to have_content("#{@client3.first_name} #{@client3.last_name}")
        expect(page).to have_content("#{@client3.email}")
      end
    end
  end
end
