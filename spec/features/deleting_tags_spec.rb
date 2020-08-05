# require "rails_helper"

# RSpec.feature "User can deleting tags" do
#   let!(:user) { FactoryBot.create(:user) }
#   let!(:category) { FactoryBot.create(:category) }
#   let!(:project) { FactoryBot.create(:project, user: user, category: category, tag_names: 'Thistagmustdie') }

#   before do
#     login_as(user)
#     assign_role!(user, :manager, project)
#     visit project_path(project)
#   end

#   scenario "successfully", js: true do
#     click_link "X"
#     expect(page).to_not have_content "Thistagmustdie"
#   end
# end
