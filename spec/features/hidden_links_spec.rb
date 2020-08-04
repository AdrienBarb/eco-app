require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  context "non-admin users (project viewers)" do
    before do
      login_as(user)
      assign_role!(user, :viewer, project)
    end

    scenario "cannot see editing link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Modifier"
      end
    end
  end
end
