class SalonRegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]


  def new
    @user = User.new
    @tenant = Tenant.new
  end

  def create
    ActiveRecord::Base.transaction do
      @tenant = Tenant.create!(tenant_params)
      @user = @tenant.users.create!(user_params.merge(role: "salon_admin"))
    end
      start_new_session_for(@user)
      redirect_to root_url(subdomain: @tenant.subdomain)

  rescue ActiveRecord::RecordInvalid
      render :new, status: :unprocessable_entity
  end


  private

   def tenant_params
     params.expect(tenant: [ :name, :subdomain, :email, :location, :phone_number ])
   end

   def user_params
     params.expect(user: [ :first_name, :last_name, :email, :phone_number, :password ])
   end
end
