class BookingPolicy < ApplicationPolicy
  def show?
    record.user == user || record.worker_profile_tag.worker_profile.user == user
  end

  def new?
    user
  end

  def create?
    new?
  end

end
