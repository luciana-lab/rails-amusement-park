class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in_user
  helper_method :current_user
  helper_method :logged_in?

  def logged_in_user
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end
  
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end
