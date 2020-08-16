class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end

  def sign_up
    @user = User.new
  end

  def login
    @user = User.login(user_params)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_token] = @user.id
    else
      render :sign_up
    end
  end

  private

  def user_params
    params.require(:user).permit(:account, :password)
  end
end
