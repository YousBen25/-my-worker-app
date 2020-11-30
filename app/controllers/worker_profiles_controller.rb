class WorkerProfilesController < ApplicationController
  before_action :set_worker_profile, only: [:show, :edit, :update, :destroy]

  def index
    @worker_profiles = WorkerProfile.all
  end

  def show
  end

  def new
    @worker_profile = WorkerProfile.new
  end

  def create
    @worker_profile = WorkerProfile.create!(worker_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_worker_profile
    @worker_profile = WorkerProfile.find(params[:id])
  end

  def worker_params
    params.require(:worker_profile).permit(:bio)
  end
end
