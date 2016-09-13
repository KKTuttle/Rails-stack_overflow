class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def autorize
    redirect_to log_in_path, alert: "Your are not logged in. Please login and try it again..." if current_user.nil?
  end

  def is_admin
    if current_user
      if current_user.admin
        flash[:alert] = 'You are admin'

      else
        flash[:alert] = 'You are not admin'
      end
      redirect_to root_url     
    end
  end

end
