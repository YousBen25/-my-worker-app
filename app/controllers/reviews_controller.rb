class ReviewsController < ApplicationController
  def create
  @review = Review.new(review_params)
  @worker_profile = WorkerProfile.find(params[:worker_profile_id])
  @review.worker_profile = @worker_profile
  @review.save
  authorize @review
  if @review.save
    redirect_to worker_profile_path(@worker_profile)
  else
    render :new
  end
  end

  private

  def review_params
    params.require(:review).permit(:description, :score)
  end
end
