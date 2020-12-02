class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  def new
    @worker_profile_tag = WorkerProfileTag.find()
  end

  def create
    booking_vars = params[:booking]
    date = booking_vars["date"].split("-")
    date = date.map(&:to_i)
    time = booking_vars["from"].to_i
    workertag = WorkerProfileTag.find(booking_vars[:worker_profile_tag_id])
    rate = workertag.rate
    price = rate*booking_vars["duration"].to_i
    @worker_profile= workertag.worker_profile

    @booking = Booking.new(
      description: booking_vars["description"],
      worker_profile_tag_id: booking_vars["worker_profile_tag_id"],
      date: DateTime.new(date[0], date[1], date[2], time),
      duration: booking_vars["duration"],
      price: price,
      user: current_user
      )

    if @booking.save
      redirect_to booking_path(@booking)
    else
      raise
      render "worker_profiles/show"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.completed!
    @booking.save
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:worker_profile_tag_id, :description, :date, :from, :duration, :address, :longitude, :latitude)
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
