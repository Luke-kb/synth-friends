class Ability
  include CanCan::Ability

  def initialize(user)
    #for guest user
    user ||= User.new
  
    if user.admin?   #admin can CRUD all
      can :manage, :all
    else
      can :read, :all  #user can read all if not logged in
    end
    if user.present? #user when logged in can manage listings and profiles owned by them
      can :manage, Listing, :lender_id => user.id
      can :manage, Profile, :id => user.id
    end
  end
end
