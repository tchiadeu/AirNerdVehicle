class BookingsController < ApplicationController
  def index
    @bookings = set_bookings
    # @bookings = Booking.where(vehicle_id: current_user.vehicles)
    @rents = set_rents
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(params[:id])
    @booking.user = current_user
    @booking.vehicle = @vehicle
    authorize @booking
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.vehicle = @vehicle
    @booking.status = "Pending"
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render new_vehicle_booking_path(@booking), status: :unprocessable_entity
    end
  end

  def update
    booking = Booking.find(params[:id])
    booking.status = params[:booking][:status]
    authorize booking
    if booking.save!
      redirect_to bookings_path
    else
      render bookings_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end, :status)
  end

  def set_bookings
    bookings = Booking.where(vehicle_id: current_user.vehicles)
    pending_bookings = bookings.where(status: "Pending").order(created_at: :desc)
    accepted_bookings = bookings.where(status: "accepted").order(start: :asc)
    declined_bookings = bookings.where(status: "declined").order(created_at: :desc)
    @bookings = pending_bookings + accepted_bookings + declined_bookings
  end

  def set_rents
    rents = Booking.where(user_id: current_user)
    pending_rents = rents.where(status: "Pending").order(created_at: :desc)
    accepted_rents = rents.where(status: "accepted").order(start: :asc)
    declined_rents = rents.where(status: "declined").order(created_at: :desc)
    @rents = pending_rents + accepted_rents + declined_rents
  end
end
