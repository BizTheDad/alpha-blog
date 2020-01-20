class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # This line makes these methods available to our views.
  helper_method :current_user, :logged_in?

  # The ||= will optimize this method. It will only do the database request if
  #
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
    end
  end
end
