require "rails_helper"

RSpec.feature "User can edit their projects" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  before do
    login_as(user)
    assign_role!(user, :editor, project)
  end

  scenario "With valid details" do
    visit project_path(project)

    click_link "Modifier mon projet"
    fill_in "Name", with: "Un autre super projet"
    fill_in "Description", with: "Une autre voiture volante"
    click_button "Valider"

    expect(page).to have_content("Votre projet a bien été modifié !")
    expect(page).to have_content("Un autre super projet")
    expect(page).to have_content("Une autre voiture volante")
  end
end
