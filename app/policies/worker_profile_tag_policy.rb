class WorkerProfileTagPolicy < ApplicationPolicy
  def create?
    record.worker_profile.user == user
  end
  def destroy?
    record.worker_profile.user == user
  end
end
