require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { FactoryBot.create(:user) }
  scenario 'With valid crendential' do
    visit "/"

    click_link "Se connecter"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    expect(page).to have_content("Connecté.")
    expect(page).to have_content("#{user.first_name}")
    expect(page).not_to have_link "Se connecter"
    expect(page).not_to have_link "S'enregistrer"
    expect(page).to have_link "Se déconnecter"
  end
end
