class RolesController < ApplicationController

  before_action :set_project, only: [:edit, :update]


  def edit
    @role = Role.find(1)
    authorize @role, :update?
  end

  def update

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
