class PagesController < ApplicationController

  skip_after_action :verify_authorized, :verify_policy_scoped

  def home
    @projects = Project.all
    render 'projects/index'
  end
end
