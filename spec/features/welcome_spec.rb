require "rails_helper"

describe "as a visitor when I visit /" do
  it "shows a splash page with links" do
    visit root_path
    expect(page).to have_button("Log In")
    expect(page).to have_link("Register")
    expect(page).to have_link("About Us")
  end
end
