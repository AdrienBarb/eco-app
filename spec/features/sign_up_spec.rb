require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"

    click_link "Sign up"
    fill_in "First name", with: "Adrien"
    fill_in "Last name", with: "Barbier"
    fill_in "Phone number", with: "06 79 09 38 18"
    fill_in "City", with: "Pont de roide"
    fill_in "Zip code", with: "25150"
    fill_in "Country", with: "France"
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
    expect(page).not_to have_link "Sign in"
    expect(page).not_to have_link "Sign up"
    expect(page).to have_link "Sign out"
  end
end
