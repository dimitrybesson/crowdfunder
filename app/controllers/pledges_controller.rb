class PledgesController < ApplicationController
  before_action :set_project, only: %i(index new create destroy)

  def index
    @pledges = @project.pledges
  end

  def new
    @pledge = @project.pledges.build
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @project = Project.find(params[:project_id])

    if @pledge.save
      if request.xhr?
        render nothing: true
      else #not xhr
        redirect_to project_path(@project), notice: "Pledge success"
      end
    else #if it doesn't save
      if request.xhr? #xhr && doesn't save
      render :new
      else
        #if not an xhr request and it doesn't save
      end
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to project_url(@project)
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount, :reward_id, :user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
