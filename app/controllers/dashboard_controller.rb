class DashboardController < ApplicationController
  def index
    @bookings = current_user.bookings.includes(:service)

    # SELECT COUNT(*) FROM bookings WHERE user_id = current_user
    @total_bookings = current_user.bookings.count

    @booking_grouping = current_user.bookings.joins(:service).group("service.title").count

    # SELECT COUNT(*), service_id FROM bookings GROUP BY service_id
    # SELECT COUNT(*), service.title FROM bookings JOIN services ON service_id = bookings.service_id GROUP BY service.name
  end
end
