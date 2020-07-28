require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"

    click_link "S'enregistrer"
    fill_in "First name", with: "Adrien"
    fill_in "Last name", with: "Barbier"
    fill_in "Phone number", with: "06 79 09 38 18"
    fill_in "City", with: "Pont de roide"
    fill_in "Zip code", with: "25150"
    fill_in "Country", with: "France"
    fill_in "Url linkedin", with: 'https://www.linkedin.com/in/adrien-barbier-5b479598/'
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Bienvenue, vous êtes connecté.")
    expect(page).not_to have_link "Se connecter"
    expect(page).not_to have_link "S'enregistrer"
    expect(page).to have_link "Se déconnecter"
  end
end
