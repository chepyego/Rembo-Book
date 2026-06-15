class HomeController < ApplicationController
  # before_action :allow_unauthenticated_access, only: %i[ index  ]

  allow_unauthenticated_access only: %i[ index about_us contact_us ]


  def index
     if Current.tenant
      if current_user&.salon_admin?
        redirect_to dashboard_url(subdomain: current_user.tenant.subdomain), allow_other_host: true
      else
       redirect_to services_path
      end
     end
  end
  def about_us;end
  def contact_us;end
end
