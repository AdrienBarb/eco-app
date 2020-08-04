require "rails_helper"

RSpec.feature "User can create project" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
  end

  scenario "With valid details" do
    visit "/"

    click_link "Super projet"

    expect(page.current_url).to eq project_url(project)
  end
end
