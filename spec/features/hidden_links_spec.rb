require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:project) { FactoryBot.create(:project, user: user, category: category) }

  context "non-connected users" do

    scenario "cannot see editing link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Modifier mon projet"
      end
    end

    scenario "cannot see editing contributor link" do
      visit project_path(project)
      within("#contributor") do
        expect(page).not_to have_link "Modifier"
      end
    end

    scenario "cannot see deleting link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Supprimer"
      end
    end
  end

  context "non-admin users (project viewers)" do
    before do
      login_as(user)
      assign_role!(user, :viewer, project)
    end

    scenario "cannot see editing link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Modifier mon projet"
      end
    end

    scenario "cannot see editing contributor link" do
      visit project_path(project)
      within("#contributor") do
        expect(page).not_to have_link "Modifier"
      end
    end

    scenario "cannot see deleting link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Supprimer"
      end
    end
  end

  context "Editor users (project editor)" do
    before do
      login_as(user)
      assign_role!(user, :editor, project)
    end

    scenario "Can see editing link" do
      visit project_path(project)
      within("#project") do
        expect(page).to have_link "Modifier mon projet"
      end
    end

    scenario "can see editing contributor link" do
      visit project_path(project)
      within("#contributor") do
        expect(page).not_to have_link "Modifier"
      end
    end

    scenario "cannot see deleting link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Supprimer"
      end
    end
  end

  context "manager users (project manager)" do
    before do
      login_as(user)
      assign_role!(user, :manager, project)
    end

    scenario "can see editing link" do
      visit project_path(project)
      within("#project") do
        expect(page).to have_link "Modifier mon projet"
      end
    end

    scenario "can see editing contributor link" do
      visit project_path(project)
      within("#contributor") do
        expect(page).to have_link "Modifier"
      end
    end

    scenario "can see deleting link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Supprimer"
      end
    end
  end

  context "admin users" do
    before do
      login_as(FactoryBot.create(:user, :admin))
    end

    scenario "can see editing link" do
      visit project_path(project)
      within("#project") do
        expect(page).to have_link "Modifier mon projet"
      end
    end

    scenario "can see editing contributor link" do
      visit project_path(project)
      within("#contributor") do
        expect(page).to have_link "Modifier"
      end
    end

    scenario "can see deleting link" do
      visit project_path(project)
      within("#project") do
        expect(page).not_to have_link "Supprimer"
      end
    end
  end
end


