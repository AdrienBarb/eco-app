require "rails_helper"

RSpec.feature "User can create answer" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }
  let!(:comment) { FactoryBot.create(:comment, user: user, project: project) }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
    visit project_path(project)
  end

  scenario "Successfully" do
    click_link "Répondre"
    fill_in "Answer", with: "Super"
    click_button "Valider"

    expect(page).to have_content("Votre réponse a bien été prise en compte")
    expect(page).to have_content("Super")
  end
end
