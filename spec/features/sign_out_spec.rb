require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "Signed-in users can sign out" do
    visit "/"

    click_link "Se déconnecter"

    expect(page).to have_content "Déconnecté."
    expect(page).to have_link "Se connecter"
    expect(page).to have_link "S'enregistrer"
    expect(page).not_to have_link "Se déconnecter"
  end
end
