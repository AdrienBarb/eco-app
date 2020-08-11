require "rails_helper"

RSpec.feature "User can create comments" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
    visit project_path(project)
  end

  scenario "Successfully" do
    click_link "Laisser un commentaire"
    fill_in "Comment", with: "J'adore votre projet !"
    click_button "Valider"

    expect(page).to have_content("Votre commentaire a bien été créé !")
    expect(page).to have_content("J'adore votre projet !")
  end
end
