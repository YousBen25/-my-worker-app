class WorkerProfilePolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user && !user.worker_profile
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
