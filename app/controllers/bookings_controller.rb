class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  def new
    @worker_profile_tag = WorkerProfileTag.find()
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

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:description, :date, :duration)
  end
end

# t.bigint "user_id", null: false
    # t.text "description"
    # t.bigint "worker_profile_tag_id", null: false
    # t.boolean "confirmation", default: false
    # t.datetime "date"
    # t.integer "duration"
    # t.integer "price"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false
    # t.index ["user_id"], name: "index_bookings_on_user_id"
    # t.index ["worker_profile_tag_id"], name: "index_bookings_on_worker_profile_tag_id"
