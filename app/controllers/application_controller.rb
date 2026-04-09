class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_user

  include Authentication # Keep this if it contains non-auth related helpers/logic
  allow_browser versions: :modern

  private


  def authenticate_user!
    unless current_user
      redirect_to signup_path, alert: "You must log in to access this page."
    end
  end


  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end


  def current_user
    @current_user
  end

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Not authorized to access admin panel"
    end
  end
end
