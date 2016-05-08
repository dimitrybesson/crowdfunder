class ProjectsController < ApplicationController
  before_action :set_project, only: %i(show edit update destroy)

  def index
    @projects = Project.all
  end

  def show
    @pledge = Pledge.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to project_url(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to project_url(@project)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_time, :end_time, rewards_attributes: [:name, :description, :threshold])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
