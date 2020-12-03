class DashboardsController < ApplicationController
  def dashboard
    authorize(current_user, policy_class: DashboardPolicy)
    @user = current_user
    @worker_profile = current_user.worker_profile
    @booking_made = Booking.where(user: current_user)
    if @worker_profile
      @worker_profile_tags = @worker_profile.worker_profile_tags.pluck(:id)
      @booking_received = Booking.where(worker_profile_tag: @worker_profile_tags)
    end
  end
end
