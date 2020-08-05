require "rails_helper"

RSpec.feature "User can create project" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }

  before do
    login_as(user)
  end

  scenario "With valid details" do
    visit user_path(user)

    click_link "Créer un projet"
    fill_in "Name", with: "Un super projet"
    fill_in "Description", with: "Une voiture volante"
    fill_in "Tag names", with: "Santé Health"
    select 'Banque', from: 'Category'
    click_button "Valider"

    expect(page).to have_content("Votre projet a bien été crée !")
    expect(page).to have_content("Un super projet")
    expect(page).to have_content("Une voiture volante")
    expect(page).to have_content("Santé")
    expect(page).to have_content("Health")
  end
end
