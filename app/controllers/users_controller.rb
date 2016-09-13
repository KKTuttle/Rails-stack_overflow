class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user=User.new(params[:user])
    @user=User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      flash[:alert] = "Welcome to the site!"
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
