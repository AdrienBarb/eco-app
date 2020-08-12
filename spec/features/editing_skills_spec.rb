require "rails_helper"

RSpec.feature "User can edit skills" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:skill) { FactoryBot.create(:skill, user: user) }

  before do
    login_as(user)
    visit skills_path
  end

  scenario "With valid details" do
    click_link 'Modifier cette compétence'
    fill_in "Title", with: "React"
    select 8, from: 'Rate'
    fill_in "Description", with: "Projet écologique"

    click_button "Valider"

    expect(page).to have_content("Votre compétence a bien été modifiée")
    expect(page).to have_content("React")
    expect(page).to have_content("Projet écologique")
    expect(page).to have_content("8")
    expect(page).not_to have_content("Ruby on Rails")
  end
end
