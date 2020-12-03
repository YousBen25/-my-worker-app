class ReviewPolicy < ApplicationPolicy
  def create?
    record.user = user
  end
end
