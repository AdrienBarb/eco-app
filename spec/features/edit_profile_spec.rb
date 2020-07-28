require "rails_helper"

RSpec.feature "User can edit their own profile" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "With valid details" do
    visit user_path(user)

    click_link "Modifier"

    fill_in "Title", with: "Ingénieur projet"
    fill_in "Description", with: "J'ai beaucoup de compétence"
    click_button "Valider"

    expect(page).to have_content("Ingénieur projet")
    expect(page).to have_content("J'ai beaucoup de compétence")
    expect(page).to have_content("Vous informations ont bien été modifiés")
  end
end
