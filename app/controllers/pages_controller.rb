class PagesController < ApplicationController

  def home
    @projects = Project.all
    render 'projects/index'
  end
end
