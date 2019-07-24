require 'rails_helper'

RSpec.describe "Oauth spec" do
  context "as a client" do
    it "can sign in with google" do
      visit '/'

      expect(page).to have_link("Sign in with Google")
    end
  end
end
