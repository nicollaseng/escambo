class AdminPolicy < ApplicationPolicy
  
  def new?
  	user.full_acess?
  end

  def destroy?
  	user.full_acess?
  end



  class Scope < Scope
    def resolve
      scope
    end
  end

end
