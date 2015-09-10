class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
helper_method :current_user, :log_in?

  def current_user

  @current_user ||=	Chef.find(session[:chef_id]) = session[:chef_id]

  end

  def log_in?

  	!!current_user

  end

  def require_user
       if !log_in?
       	redirect_to :Back
       end

  end

end
