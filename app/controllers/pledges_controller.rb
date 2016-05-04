class PledgesController < ApplicationController
  before_action :set_project, only: %i(index new create destroy)

  def index
    @pledges = @project.pledges
  end

  def new
    @pledge = @project.pledges.build
  end

  def create
    @pledge = @project.pledges.build(pledge_params)
    if @pledge.save

      #redirect_to project_url(@project), notice: "Pledge accepted!"
    else
      render :new
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to project_url(@project)
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount, :reward_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
