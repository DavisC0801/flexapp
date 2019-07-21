require 'rails_helper'

RSpec.describe "As a registered client" do
  describe 'on my dashboard' do
    describe 'if my last weigh in log is over a week' do

      it "prompts for a weigh in if last log is week old" do
        # client = create(:client)
        # allow_any_instance_of(ApplicationController).to recieve(:current_client).and_return(client)

        visit client_dashboard_path

      end

    end
  end
end
