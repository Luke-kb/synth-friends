# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #for guest user
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
    if user.present?
      can :update, Listing, :lender_id => user.id
      can :update, Profile, :id => user.id
    end
  end
end
