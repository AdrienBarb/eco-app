require 'rails_helper'

RSpec.describe ProjectPolicy do

  context "permissions" do
    subject { ProjectPolicy.new(user, project) }
    let(:user) { FactoryBot.create(:user) }
    let(:category) { FactoryBot.create(:category) }
    let(:project) { FactoryBot.create(:project, user: user, category: category) }

    context "for anonymous users" do
      it { should permit_action :show }
    end

    context "for viewers of the project" do
      before { assign_role!(user, :viewer, project) }

      it { should permit_action :show }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
    end

    context "for editors of the project" do
      before { assign_role!(user, :editor, project) }
      it { should permit_action :show }
      it { should permit_action :update }
      it { should_not permit_action :destroy }
    end

    context "for managers of the project" do
      before { assign_role!(user, :manager, project) }
      it { should permit_action :show }
      it { should permit_action :update }
      it { should permit_action :destroy }
    end

  context "for managers of other projects" do
    before do
      assign_role!(user, :manager, FactoryBot.create(:project, user: user, category: category))
    end

    it { should permit_action :show }
    it { should_not permit_action :update }
    it { should_not permit_action :destroy }
  end

  context "for administrators" do
  let(:user) { FactoryBot.create :user, :admin }
      it { should permit_action :show }
      it { should permit_action :update }
      it { should permit_action :destroy }
    end
  end
end
