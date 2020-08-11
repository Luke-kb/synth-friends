class HomeController < ApplicationController
  include Devise::Controllers::Helpers  #allows current_user helper to be used in HomeController
  def page
    @listings = Listing.all
    @user = current_user  
  end

  def not_found
    render plain: "page not found"
  end 
end
