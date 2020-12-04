class WorkerProfilesController < ApplicationController
  before_action :set_worker_profile, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]

  DISTANCE = 1000
  def index
    @tags = Tag.all
    if params[:address].present? && params[:job_type].present?
      # @worker_profiles = WorkerProfile.search_by_address(params[:address]).search_by_job(params[:job_type])
      @worker_profiles = WorkerProfile.near(params[:address], DISTANCE).search_by_job(params[:job_type])
    elsif params[:address].present?
      ## @worker_profiles = WorkerProfile.search_by_address(params[:address])
      @worker_profiles = WorkerProfile.near(params[:address], DISTANCE)
    elsif params[:job_type].present?
      @worker_profiles = WorkerProfile.search_by_job(params[:job_type])
    else
      @worker_profiles = WorkerProfile.all
    end

    @markers = @worker_profiles.geocoded.map do |worker_location|
      {
        lat: worker_location.latitude,
        lng: worker_location.longitude
      }
    end
  end

  def show
    authorize @worker_profile
    @user = current_user
    @booking = Booking.new
    @working_hash = @worker_profile.calculate_availabilities
    # @working_days.each do |day|
    #   @worker_profile.availabilities.each do |availability|
    #     if(availability.day == day)
    #       if(@working_hash["#{day}"])
    #         @working_hash["#{day}"].push("#{availability.from}-#{availability.to}")
    #       else
    #         @working_hash["#{day}"] = ["#{availability.from}-#{availability.to}"]
    #       end
    #     end
    #   end
    # end
  end

  def new
    @worker_profile = WorkerProfile.new
    authorize @worker_profile
  end

  def create
    @worker_profile = WorkerProfile.new(worker_params)
    authorize @worker_profile
    @worker_profile.user = current_user
    if @worker_profile.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize @worker_profile
    @worker_profile_tag = WorkerProfileTag.new
    @availability = Availability.new
  end

  def update
    authorize @worker_profile
    @worker_profile.update(worker_params)
    redirect_to edit_worker_profile_path(@worker_profile)
  end

  def destroy
    @worker_profile.destroy
    authorize @worker_profile
    redirect_to "/"
  end

  private

  def set_worker_profile
    @worker_profile = WorkerProfile.find(params[:id])
  end

  def worker_params
    params.require(:worker_profile).permit(:bio, :photo, :address, :longitude, :latitude)
  end
end
