class SalonRegistrationsController < ApplicationController
allow_unauthenticated_access only: %i[new create_step_one new_step_two create]

  def new
    @tenant = Tenant.new(session[:tenant_params] || {})
  end
  def create_step_one
     session[:tenant_params] = params.require(:tenant).permit(:name, :subdomain, :email, :phone_number, :location)

     redirect_to new_step_two_salon_registration_path
  end

  def new_step_two
    if session[:tenant_params].blank?
      redirect_to new_salon_registration_path, alert: "please complete step 1 first"
      return
    end
    @tenant = Tenant.new(session[:tenant_params])
    @user = User.new
  end
  def create
    ActiveRecord::Base.transaction do
      @tenant = Tenant.create!(session[:tenant_params])
      @user = @tenant.users.create!(user_params.merge(role: "salon_admin"))
    end
      session.delete(:tenant_params)
      start_new_session_for(@user)
      redirect_to root_url(subdomain: @tenant.subdomain), allow_other_host: true

  rescue ActiveRecord::RecordInvalid
      @tenant = Tenant.new(session[:tenant_params])
      @user = User.new(user_params)
      render :new_step_two, status: :unprocessable_entity
  end


  private

   def tenant_params
     params.expect(tenant: [ :name, :subdomain, :email, :location, :phone_number ])
   end

   def user_params
     params.expect(user: [ :first_name, :last_name, :email_address, :password, :password_confirmation ])
   end
end
