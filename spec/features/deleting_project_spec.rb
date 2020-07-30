require "rails_helper"

RSpec.feature "Users can delete their projects" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  before do
    login_as(user)
  end

  scenario "User can delete a project" do
    visit user_project_path(user, project)

    click_link "Suprimer"

    expect(page).to have_content("Votre projet a bien été supprimé !")
    expect(page).not_to have_content(project.name)
    expect(page.current_url).to eq user_url(user)
  end
end
