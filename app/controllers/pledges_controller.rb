class PledgesController < ApplicationController
  before_action :set_project, only: %i(index new create destroy)

  def index
    @pledges = @project.pledges
  end

  def new
    @pledge = @project.pledges.build
  end

  def create
    @reward = Reward.find(params[:reward_id])
    @pledge = @reward.pledges.build(xhr_pledge_params)

    if @pledge.save
      render nothing: true
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

  def xhr_pledge_params
    {
      amount: @reward.threshold,
      user_id: current_user.id
    }

  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
