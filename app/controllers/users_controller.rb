class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  def update
    @user = User.find(params[:id])
    @user.image = user_params[:image]
    @user.save
    redirect_to user_path(@user)
  end

  def index
    @users = User.search(params[:search]).all
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:image)
  end
end
