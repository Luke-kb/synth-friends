class HomeController < ApplicationController
  include Devise::Controllers::Helpers
  def page
    @listings = Listing.all
    @user = current_user
  end

  def not_found
    render plain: "page not found"
    # render "pages/error_template"
  end 
end
