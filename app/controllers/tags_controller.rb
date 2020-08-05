class TagsController < ApplicationController

  def remove
    @project = Project.find(params[:project_id])
    @tag = Tag.find(params[:id])
    authorize @project, :tag?
    @project.tags.destroy(@tag)
    head :ok
  end
end
