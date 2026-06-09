class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  # rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    # Rails.logger.info("PARAMS: #{params.inspect}")  # 🔍 Log the incoming parameters

    credentials = session_params.to_h

    if user = User.authenticate_by(email_address: credentials[:email_address], password: credentials[:password])
      start_new_session_for user

      if user.admin?
        redirect_to avo.root_path

      elsif user.salon_admin?

        redirect_to dashboard_url(subdomain: user.tenant.subdomain), allow_other_host: true
      else
        redirect_to root_path
      end


    else
          redirect_to new_session_path, alert: "Try another email or password"
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
  private

  def session_params
     #  params.require(:session).permit(:email_address, :password)
     params.permit(:email_address, :password)
  end
end
