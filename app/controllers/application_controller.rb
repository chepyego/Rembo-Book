class ApplicationController < ActionController::Base
  before_action :set_current_user, :set_current_tenant
  helper_method :current_user

  include Authentication # Keep this if it contains non-auth related helpers/logic
  allow_browser versions: :modern



  private

  def authorize_staff!
    unless current_user&.staff?
      redirect_to root_path, alert: "not authorize to access this"
    end
  end

  def set_current_tenant
    return if request.subdomain.blank?
    Current.tenant = Tenant.find_by(subdomain: request.subdomain)

    unless Current.tenant
      redirect_to root_url(subdomain: false, host: request.domain), allow_other_host: true
    end
  end

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
