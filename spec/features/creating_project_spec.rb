require "rails_helper"

RSpec.feature "User can edit their own profile" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "With valid details" do
    visit user_path(user)

    click_link "Créer un projet"
    fill_in "Name", with: "Un super projet"
    fill_in "Description", with: "Une voiture volante"
    click_button "Créer"

    expect(page).to have_content("Votre projet a bien été crée !")
    expect(page).to have_content("Un super projet")
    expect(page).to have_content("Une voiture volante")
  end
end
