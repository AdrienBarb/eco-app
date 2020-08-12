require "rails_helper"

RSpec.feature "User can delete skills" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:skill) { FactoryBot.create(:skill, user: user) }

  before do
    login_as(user)
    visit skills_path
  end

  scenario "Success" do
    click_link "Suprimer"

    expect(page).not_to have_content("Ruby on Rails")
  end
end
