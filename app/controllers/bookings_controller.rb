class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.user = current_user
    @booking.vehicle = @vehicle
    @booking = Booking.new(params[:id])
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.user = current_user
    @booking.vehicle = @vehicle
    @booking = Booking.new(params[:id])
    @booking.save
    redirect_to booking_path(@booking)
  end

  def accept
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
