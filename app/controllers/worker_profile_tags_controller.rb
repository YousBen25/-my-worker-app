class WorkerProfileTagsController < ApplicationController
  def create
    @worker_profile = WorkerProfile.find(params[:worker_profile_id])
    @tags = Tag.find(params[:worker_profile_tag][:tag])
    @tags.each do |tag|
      @worker_profile_tag = WorkerProfileTag.new
      @worker_profile_tag.worker_profile = @worker_profile
      @worker_profile_tag.tag = tag
      @worker_profile_tag.save!
    end
  end

  def destroy
    @worker_profile_tag = WorkerProfileTag.find(params[:id])
    @worker_profile_tag.destroy
  end
end
