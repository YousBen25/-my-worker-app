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
    @worker_profile = WorkerProfile.new(worker_params)
    @worker_profile.save
    if @worker_profile.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @worker_profile_tag = WorkerProfileTag.new
    @availability = Availability.new
  end

  def update
    @worker_profile.update(worker_params)
    redirect_to edit_worker_profile_path(@worker_profile)
  end

  def destroy
    @worker_profile.destroy
    redirect_to "/"
  end

  private

  def set_worker_profile
    @worker_profile = WorkerProfile.find(params[:id])
  end

  def worker_params
    params.require(:worker_profile).permit(:bio, :photo)
  end
end
