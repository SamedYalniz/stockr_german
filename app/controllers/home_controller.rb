class HomeController < ApplicationController

  def index
    return   @users = User.search(params[:search_company]) if params[:search_company]
  end

end
