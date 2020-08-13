require "rails_helper"

RSpec.feature "Users can receive notifications about ticket updates" do
  let(:alice) { FactoryBot.create(:user, email: "alice@example.com") }
  let(:bob) { FactoryBot.create(:user, email: "bob@example.com") }
  let(:category) { FactoryBot.create(:category) }
  let(:project) { FactoryBot.create(:project, user: bob, category: category) }
  let(:comment) { FactoryBot.create(:comment, user: alice, project: project) }


  before do
    assign_role!(alice, :manager, project)
    assign_role!(bob, :manager, project)
    login_as(bob)
    visit new_comment_answer_path(comment)
  end

  scenario "ticket authors automatically receive notifications" do
    fill_in "Answer", with: "Thanks !"
    click_button "Valider"

    email = find_email!(alice.email)
    expected_subject = "[Eco-app] #{project.name}"
    expect(email.subject).to eq expected_subject

    click_first_link_in_email(email)
    expect(current_path).to eq project_path(project)
  end
end
