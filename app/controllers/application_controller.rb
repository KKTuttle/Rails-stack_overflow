class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def autorize
    redirect_to log_in_path, alert: "Not autorized. Please log in and try it again..." if current_user.nil?
  end
end
