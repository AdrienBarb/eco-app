class PagesController < ApplicationController

  skip_after_action :verify_authorized, :verify_policy_scoped

  def home
    projects = Project.all.sort_by { |project| project.votes.count }
    @projects = projects.reverse
    @projects_creation_date = policy_scope(Project).order(created_at: :desc)
    @users = User.all
  end

end
