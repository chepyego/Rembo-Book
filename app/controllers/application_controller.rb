class ApplicationController < ActionController::Base
  include Authentication

  before_action :resume_session
  before_action :set_current_tenant
  helper_method :current_user
  before_action :debug_host


  # Keep this if it contains non-auth related helpers/logic
  allow_browser versions: :modern



  private

  def authorize_staff!
    unless current_user&.staff?
      redirect_to root_path, alert: "not authorize to access this"
    end
  end

  def set_current_tenant
    return if request.subdomain.blank?

    Rails.logger.debug "SUBDOMAIN DEBUG: '#{request.subdomain}'"


    Current.tenant = Tenant.find_by(subdomain: request.subdomain)

    unless Current.tenant
      redirect_to root_url(subdomain: false, host: request.domain), allow_other_host: true
    end
  end

  def authenticate_user!
    unless current_user
      redirect_to sign_up_path, alert: "You must log in to access this page."
    end
  end

    def debug_host
      Rails.logger.debug "RAW HOST: #{request.host} | SUBDOMAIN: #{request.subdomain} | ORIGINAL_URL: #{request.original_url}"
    end



  def current_user
    Current.user
  end

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Not authorized to access admin panel"
    end
  end
end
