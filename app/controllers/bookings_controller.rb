class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :show, :update, :destroy]
  def new
    authorize @booking
    @worker_profile_tag = WorkerProfileTag.find()
  end

  def create
    # booking_vars = params[:booking]
    # date = booking_vars["date"].split("-")
    # date = date.map(&:to_i)
    # time = booking_vars["from"].to_i
    # workertag = WorkerProfileTag.find(params[:booking][:worker_profile_tag_id]) if params[:booking][:worker_profile_tag_id.present?

    @worker_profile= WorkerProfile.find(params[:worker_profile_id])
    @booking = Booking.new(booking_params)
    @booking.date = generate_date
    @booking.user = current_user
    authorize @booking
    # @booking = Booking.new(
    #   description: booking_vars["description"],
    #   worker_profile_tag_id: booking_vars["worker_profile_tag_id"],
    #   date: DateTime.new(date[0], date[1], date[2], time),
    #   duration: booking_vars["duration"],
    #   price: price,
    #   user: current_user
    #   )

    if @booking.save
      redirect_to booking_path(@booking)
    else
      @working_hash = @worker_profile.calculate_availabilities
      render "worker_profiles/show"
    end
  end

  def show
    authorize @booking
    @booking_location = []
    if @booking.latitude && @booking.longitude
      @booking_location =[ {
        lat: @booking.latitude,
        lng: @booking.longitude
      }]
  end
end

  def edit
    @worker_profile = @booking.worker_profile_tag.worker_profile
    @working_hash = @worker_profile.calculate_availabilities
    authorize @booking
  end

  def update
    # booking_vars = params[:booking]
    # date = booking_vars["date"].split("-")
    # date = date.map(&:to_i)
    # time = booking_vars["from"].to_i
      # description: booking_vars["description"],
      # date: DateTime.new(date[0], date[1], date[2], time),
      # duration: booking_vars["duration"],
      # price: price,
    @booking.date = generate_date
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render "worker_profiles/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to "/dashboard"
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.completed!
    @booking.save
    redirect_to dashboard_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.completed!
    @booking.save
    redirect_to dashboard_path
  end

  private

  def generate_date
    return nil if params[:booking]["date"].blank? ||  params[:booking]["from"].blank?
    date = params[:booking]["date"].split("-")
    date = date.map(&:to_i)
    time = params[:booking]["from"].to_i
    DateTime.new(date[0], date[1], date[2], time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:worker_profile_tag_id, :description, :duration, :address)
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
