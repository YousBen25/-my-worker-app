class BookingsController < ApplicationController

  # before_action :set_booking
  def new
    @worker_profile = Booking.find(params[:worker_profile_id])
    @booking = Booking.new
  end

  def create
   
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def booking_params
    params.require(:booking).permit(:description, :date, :duration, :price, :confirmation, )
  end

  def set_booking
    @booking = Booking.find(params[:worker_profile_id])
  end
end
