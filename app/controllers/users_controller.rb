class UsersController < ApplicationController
  def show
  end

  def edit
  end
  def update
    @user = User.find(params[:id])
    @user.image = user_params[:image]
    @user.save
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:image)
  end
end
