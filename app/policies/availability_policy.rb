class AvailabilityPolicy < ApplicationPolicy
  def create?
    record.worker_profile.user == user
  end
end
