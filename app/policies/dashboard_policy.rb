class DashboardPolicy < ApplicationPolicy
  def dashboard?
    user
  end
end
