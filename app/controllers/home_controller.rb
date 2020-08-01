class HomeController < ApplicationController
  def page
  end

  def not_found
    render plain: "page not found"
    # render "pages/error_template"
  end 
end
