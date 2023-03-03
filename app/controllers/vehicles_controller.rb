class VehiclesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        vehicles.category ILIKE :query
        OR vehicles.city ILIKE :query
      SQL
      @vehicles = Vehicle.where(sql_query, query: "%#{params[:query]}%")
    else
      @vehicles = Vehicle.all
    end
    
    @markers = @vehicles.geocoded.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {vehicle: vehicle}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def owner_index
    @owner_vehicles = Vehicle.where(user_id: current_user)
    authorize @owner_vehicles
  end

  def show
    set_vehicle
    @booking = Booking.new
    authorize @vehicle
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    authorize @vehicle
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    set_vehicle
    authorize @vehicle
  end

  def update
    set_vehicle
    authorize @vehicle
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
    params.require(:vehicle).permit(:name, :image, :price, :city, :category, :available, :user, images: [])
  end
end
