class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :show, :update, :destroy]
  def new
    @worker_profile_tag = WorkerProfileTag.find()
  end

  def create
    # booking_vars = params[:booking]
    # date = booking_vars["date"].split("-")
    # date = date.map(&:to_i)
    # time = booking_vars["from"].to_i
    # workertag = WorkerProfileTag.find(params[:booking][:worker_profile_tag_id]) if params[:booking][:worker_profile_tag_id.present?

    @worker_profile= WorkerProfile.find(params[:worker_profile_id])
    @booking = Booking.new(custom_booking_params)
    @booking.date = generate_date
    @booking.user = current_user

    # @booking = Booking.new(
    #   description: booking_vars["description"],
    #   worker_profile_tag_id: booking_vars["worker_profile_tag_id"],
    #   date: DateTime.new(date[0], date[1], date[2], time),
    #   duration: booking_vars["duration"],
    #   price: price,
    #   user: current_user
    #   )

    if @booking.save
      session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: @worker_profile.user.first_name,
            amount: @booking.price * 100,
            currency: 'usd',
            quantity: 1
          }],
          success_url: booking_url(@booking),
          cancel_url: booking_url(@booking)
        )

      @booking.update(checkout_session_id: session.id)
      redirect_to new_booking_payment_path(@booking)
    else
      @working_hash = @worker_profile.calculate_availabilities
      render "worker_profiles/show"
    end
  end

  def show
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


  def custom_booking_params
    booking_vars = params[:booking]
    date = booking_vars["date"].split("-")
    date = date.map(&:to_i)
    time = booking_vars["from"].to_i
    {
      description: booking_vars["description"],
      date: DateTime.new(date[0], date[1], date[2], time),
      duration: booking_vars["duration"],
      address: booking_vars["address"],
      worker_profile_tag_id: booking_vars["worker_profile_tag_id"],
      state: "pending"
    }
  end

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

