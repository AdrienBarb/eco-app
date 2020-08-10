class PagesController < ApplicationController

  skip_after_action :verify_authorized, :verify_policy_scoped

  def home
    if params[:q].present?
      @projects = Project.search(params[:q]).records
      render "projects/index"
    else
      @projects = Project.all
      render "projects/index"
    end
  end

end
