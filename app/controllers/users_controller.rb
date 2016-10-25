class UsersController < ApplicationController


  def new
  end

  def create
    # byebug
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/register'
    end
  end

  def welcome
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
