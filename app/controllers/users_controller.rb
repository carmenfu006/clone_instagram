class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Signed up!'
    end
      redirect_to new
  end

  def show
    @user = User.find(params[:id])
    @photo = @user.photos
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
