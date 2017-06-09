class OrderLinePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve

      if user.admin? || user.waiter?
        scope.all
      else
        false
      end
    end
  end

   def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
