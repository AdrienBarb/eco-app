require "rails_helper"

RSpec.feature "User can see their own profile" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario 'See details of the profile' do
    visit "/"

    click_link "Mon profil"

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("Mon profil")
    expect(page).to have_link "Modifier"
  end
end
