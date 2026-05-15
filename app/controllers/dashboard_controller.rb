class DashboardController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    if current_user.admin?
     @bookings = Booking.all
      # superadmin sees everything across all tenants
    elsif current_user.salon_admin?
      @bookings = Current.tenant.bookings.includes(:service, :user)
      @total_bookings = Current.tenant.bookings.count
      @total_revenue = Current.tenant.bookings.joins(:service).sum("services.price")
      @upcoming_today = Current.tenant.bookings.where(date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      # salon admin sees their tenant data
    else
      @bookings  = current_user.bookings

      # customer sees their own bookings
    end
  end
end
