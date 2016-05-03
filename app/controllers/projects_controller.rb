class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # set user_id to current_user
    if @project.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_url(@project)
    else
      render :edit
    end
  end

  def destroy

  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_time, :end_time)
  end
end
