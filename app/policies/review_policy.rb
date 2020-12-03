class ReviewPolicy < ApplicationPolicy
  def create?
    record.booking.user == user
  end
end
