class AvailabilitiesController < ApplicationController
  def create
    @worker_profile = WorkerProfile.find(params[:worker_profile_id])
    @availability = Availability.new(availability_params)
    @availability.worker_profile = @worker_profile
    @availability.from = DateTime.new(
                                      params[:availability]["from(1i)"].to_i,
                                      params[:availability]["from(2i)"].to_i,
                                      params[:availability]["from(3i)"].to_i,
                                      params[:availability]["from(4i)"].to_i,
                                      params[:availability]["from(5i)"].to_i
                                      )
    @availability.to = DateTime.new(
                                      params[:availability]["to(1i)"].to_i,
                                      params[:availability]["to(2i)"].to_i,
                                      params[:availability]["to(3i)"].to_i,
                                      params[:availability]["to(4i)"].to_i,
                                      params[:availability]["to(5i)"].to_i
                                      )
    @availability.save
    redirect_to edit_worker_profile_path(@worker_profile)
  end

  def availability_params
    params.require(:availability).permit(:day)
  end
end
