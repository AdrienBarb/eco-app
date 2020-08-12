require "rails_helper"

RSpec.feature "User can add skills" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit user_path(user)
  end

  scenario "With valid details" do
    click_link "Editer mes compétences"
    click_link "Ajouter une compétence"
    fill_in "Title", with: "Ruby on Rails"
    select 6, from: 'Rate'
    fill_in "Description", with: "J'ai déjà développé une application"

    click_button "Valider"

    expect(page).to have_content("Votre compétence a bien été crée !")
    expect(page).to have_content("Ruby on Rails")
    expect(page).to have_content("J'ai déjà développé une application")
    expect(page).to have_content("6")
  end
end
