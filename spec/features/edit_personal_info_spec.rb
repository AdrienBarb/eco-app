require "rails_helper"

RSpec.feature "User can edit their personal informations" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "With valid details" do
    visit "/"

    click_link "Modifier mes informations"
    fill_in "Phone number", with: "06 78 94 27 26"
    fill_in "City", with: "Lyon"
    fill_in "Zip code", with: 69000
    fill_in "Country", with: "France"
    fill_in "Url linkedin", with: "www.adrien.fr"
    fill_in "Current password", with: "password"
    click_button "Valider"

    expect(page).to have_content("Votre compte a été modifié avec succès.")

    visit user_path(user)

    within(".profil-card") do
      expect(page).to have_content "Lyon"
    end
  end
end
