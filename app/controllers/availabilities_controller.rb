class AvailabilitiesController < ApplicationController
  def create
    @worker_profile = WorkerProfile.find(params[:worker_profile_id])
    @availability = Availability.new
    @availability.worker_profile = @worker_profile
    @availability.save
    redirect_to edit_worker_profile_path(@worker_profile)
  end
end
