class BookingsController < ApplicationController
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
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render new_vehicle_booking_path(@booking), status: :unprocessable_entity
    end
  end

  def accept
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
