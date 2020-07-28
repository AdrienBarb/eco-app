require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario do
    visit "/"

    click_link "Sign out"

    expect(page).to have_content "Signed out successfully."
    expect(page).to have_link "Sign in"
    expect(page).to have_link "Sign up"
    expect(page).not_to have_link "Sign out"
  end
end
