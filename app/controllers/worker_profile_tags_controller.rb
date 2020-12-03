class WorkerProfileTagsController < ApplicationController
  def create
    @worker_profile = WorkerProfile.find(params[:worker_profile_id])
    tag = Tag.find(params[:worker_profile_tag][:tag])
    @worker_profile_tag = WorkerProfileTag.new
    @worker_profile_tag.worker_profile = @worker_profile
    @worker_profile_tag.tag = tag
    @worker_profile_tag.rate = params[:worker_profile_tag][:rate]
    @worker_profile_tag.save
    redirect_to edit_worker_profile_path(@worker_profile)
    authorize @worker_profile_tag
  end

  def destroy
    @worker_profile_tag = WorkerProfileTag.find(params[:id])
    @worker_profile_tag.destroy
    redirect_to edit_worker_profile_path(@worker_profile_tag.worker_profile)
    authorize @worker_profile_tag
  end
end
