class UsersController < ApplicationController
  respond_to :html, :json
  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    respond_with @user
  end

  def index
    @users = User.search(params[:search]).all
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:image, :email, :description, :street, :city, :country, :contact_number, :company_name, :postcode)
  end
end
