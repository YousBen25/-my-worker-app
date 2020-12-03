class DashboardPolicy < ApplicationPolicy
  def dashboard?
    user && user.worker_profile
  end
end
