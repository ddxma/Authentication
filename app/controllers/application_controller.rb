class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Make current_user method available in the views
  # Do not open a line between helper_method and def current_user
  helper_method :current_user
  # Determine whether a user is logged in or logged out.
  # Check if there is a user in the db with a given session id
  # If there is, user is logged in, and @current_user will store that user
  # Otherwise, the user is logged out and the @current user = nil
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  # Redirect logged out users to the login page
  def require_user 
    redirect_to '/login' unless current_user 
  end

end
