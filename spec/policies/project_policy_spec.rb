require 'rails_helper'

RSpec.describe ProjectPolicy do

  permissions :show? do

    let!(:user) { FactoryBot.create(:user) }
    let!(:category) { FactoryBot.create(:category) }
    let!(:project) { FactoryBot.create(:project, user: user, category: category) }

    it "Allow anonymous users" do
      expect(subject).to permit(nil, project)
    end

    it "allows viewers of the project" do
      assign_role!(user, :viewer, project)
      expect(subject).to permit(user, project)
    end

    it "allows editors of the project" do
      assign_role!(user, :editor, project)
      expect(subject).to permit(user, project)
    end

    it "allows managers of the project" do
      assign_role!(user, :manager, project)
      expect(subject).to permit(user, project)
    end

    it "allows administrators" do
      admin = FactoryBot.create :user, :admin
      expect(subject).to permit(admin, project)
    end
  end
end
