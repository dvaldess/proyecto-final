# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # 
      user ||= User.new # guest user (not logged in)
      cannot :manage, :all
      # if a user is logged in
      if user.present?
        if user.admin?
          # Only admins have the privilege to manage everything
          # can :manage, :all
          alias_action :create, :read, :update, :to => :cru
          can :cru, :all
        else
          alias_action :create, :read, :to => :cru
          alias_action :create, :read, :to => :cr
          can :cru, Contact
          can :cr, Order, user_id: user.id 
          can :read, Product
          can :read, Client
        end
      elsex
        can :read, :sign_up
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
