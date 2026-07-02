# app/controllers/bookings_controller.rb

class BookingsController < ApplicationController
  # Only restrict index and destroy, allow new/create/success for guests
  before_action :authenticate_user!, only: %i[ index destroy ]
  # set_booking is only needed for actions that operate on an existing record
  before_action :set_booking, only: %i[ success destroy ]
  allow_unauthenticated_access only: %i[ new create success]


  def new
    @booking = Booking.new
    # Safer: Ensures the service actually belongs to Bella's salon
    @service = Current.tenant.services.find(params[:service_id])
  end

  def index
    # Only show bookings for the logged-in user
    # if current_user.admin?
    #   @bookings = Current.tenant.bookings
    # else
    #   @bookings = Current.tenant.bookings.for_user(current_user)
    # end
    @bookings = Current.tenant.bookings
    @upcoming = Current.tenant.bookings.upcoming
  end

  def success
    # @booking is set by set_booking
    # You might want to add an authorization check here, e.g.,
    # unless @booking.user == current_user
    #   redirect_to root_path, alert: "Not authorized."
    # end
  end

  def create
       @booking = Current.tenant.bookings.build(booking_params) # Use .build
       @booking.user = current_user if current_user

    if @booking.save
      # BookingMailer.confirmed_booking(@booking).deliver_now
      # BookingMailer.admin_new_booking_notification(@booking).deliver_now
      redirect_to success_booking_path(@booking)
    else
      flash.now[:alert]= "Something went wrong. Please check the form."
      render :new, status: :unprocessable_entity # Render new template to show errors
    end
  end

  def destroy
   # @booking is set by set_booking

   @booking.destroy
   redirect_to bookings_path, notice: "Booking successfully cancelled."
  end

  private

  def booking_params
    params.require(:booking).permit(:service_id, :date, :name, :email, :phone_number)
  end

  def set_booking
    @booking = Current.tenant.bookings.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Booking not found."
  end
end
