class RewardsController < ApplicationController
  before_action :set_reward, only: %i(show edit update destroy)
  before_action :set_project, except: :index

  def index
    @rewards = Project.find(params[:project_id]).rewards
  end

  def show
  end

# Are these going to be necessary? How does accepting nested business work?
  def new
    @reward = @project.rewards.build
  end

  def create
    @reward = @project.rewards.build(reward_params)
    if @reward.save
      redirect_to project_url(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reward.update_attributes(reward_params)
      redirect_to project_url(@project)
    else
      render :edit
    end
  end

  def destroy
    @reward.destroy
    redirect_to project_url(@project)
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :description, :threshold)
  end

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
