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
    select 'Banque', from: 'Category'
    click_button "Valider"

    expect(page).to have_content("Votre projet a bien été crée !")
    expect(page).to have_content("Un super projet")
    expect(page).to have_content("Une voiture volante")
  end
end
