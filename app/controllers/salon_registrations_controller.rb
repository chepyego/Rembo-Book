class SalonRegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]

  # GET /salon_registration
  def new
    @tenant = Tenant.new
    @user = User.new
  end

  # POST /salon_registration
  def create
    @tenant = Tenant.new(tenant_params)
    @user = @tenant.users.new(user_params.merge(role: "salon_admin"))

    # 3. The Atomic Transaction Block
    ActiveRecord::Base.transaction do
      @tenant.save!
      @user.save!
    end

    # 4. Success Flow: Authenticate and send them to their isolated tenant domain
    start_new_session_for(@user)
    redirect_to dashboard_url(subdomain: @tenant.subdomain), allow_other_host: true

  rescue ActiveRecord::RecordInvalid

    render :new, status: :unprocessable_entity
  end

  private

  def tenant_params
    params.expect(tenant: [ :name, :subdomain, :email, :location, :phone_number, :operating_hours ])
  end

  def user_params
    params.expect(user: [ :first_name, :last_name, :email_address, :password, :password_confirmation ])
  end
end
