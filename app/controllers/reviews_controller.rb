class ReviewsController < ApplicationController
  def create
  @review = Review.new(review_params)
  @booking = Booking.find(params[:booking_id])
  @review.booking = @booking
  @review.user = current_user
  authorize @review
  if @review.save
    redirect_to booking_path(@booking)
  else
    render :new
  end
  end

  private

  def review_params
    params.require(:review).permit(:description, :score)
  end
end
