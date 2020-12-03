class AvailabilitiesController < ApplicationController
  def create
    @worker_profile = WorkerProfile.find(params[:worker_profile_id])
    @availability = Availability.new(availability_params)
    @availability.worker_profile = @worker_profile
    @availability.save
    redirect_to edit_worker_profile_path(@worker_profile)
    authorize @availability
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
    redirect_to edit_worker_profile_path(@availability.worker_profile)
    authorize @availability
  end

  def availability_params
    params.require(:availability).permit(:day, :from, :to )
  end
end
