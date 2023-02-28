class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    set_vehicle
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    set_vehicle
  end

  def update
    set_vehicle
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle
    else
      render 'edit'
    end
  end

  def available?
    # booking.end booking.start faire la diff si true = avalaible si false = unavailable
    # @booking = Booking.new
    # set_vehicle
    # method = booking.end - booking.start
    # @vehicle.available = false if vehicle.booking.date.include?(method)
  end

  def filter
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :image, :price, :city, :category, :available, :user)
  end
end
