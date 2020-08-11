require "rails_helper"

RSpec.feature "User can upvote for a project" do
  let!(:user) {FactoryBot.create(:user)}
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
    visit project_path(project)
  end

  scenario "Vote for the first time" do
    click_link "Voter"

    within('#vote') do
      expect(page).to have_content("1")
    end
  end

  scenario "Vote for the second time" do
    click_link "Voter"
    click_link "Voter"

    expect(page).to have_content("Vous avez déja voté !")
  end
end
