# require "rails_helper"
#
# describe "As a Client when I visit my dashboard and have no statistic info" do
#   before :each do
#     client = create(:client)
#     allow_any_instance_of(ApplicationController).to receive(:current_client).and_return(client)
#   end
#
#   it "shows a message saying 'please enter starting information'" do
#     visit client_dashboard_path
#     expect(page).to have_content("Please enter starting information")
#   end
# end

# When I click the link labeled "Enter starting information"
# I am taken to a form to enter my current weight, height, allergies and food preferences
