class Api::V1::RidesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_ride, only: [:show, :edit, :update, :ride_complete]
  before_action :search_ride, only: [:create]
  before_action :check_existing_ride, only: [:create]

  # GET /api/v1/rides
  def index
    @rides = Ride.all
  end

  # GET /api/v1/rides/1
  def show
  end

  # POST /api/v1/rides
  def create
    @ride = Ride.new(ride_params)
    @ride.cab_id = @cab.id
    @ride.source = params[:source]
    @ride.destination = params[:destination]
    @ride.cost = 10 ##Hard coded
    @ride.completed = false
    if @ride.save
      @ride.cab.update(available: false)
      render json: { success: true, message: 'Ride has started.', ride: @ride }
    else
      render json: { success: false, message: @ride.errors.messages.flatten.join(" ")}
    end
  end

  def ride_complete
    @ride.update(completed: true)
    @ride.cab.update(available: true)
    render json: { success: true, message: "Ride completed"}
  end

  # PATCH/PUT /api/v1/rides/1
  def update
    if @ride.update(ride_params)
      render json: { success: true, message: 'Ride was successfully updated.' }
    else
      render json: { success: false, message: @ride.errors.messages.flatten.join(" ") }
    end
  end

  private
    def set_ride
      @ride = Ride.where(id: params[:id]).first
      return render json: { success: false, message: "Ride not found"} if @ride.blank?
    end

    def check_existing_ride
      ride_check = Customer.where(id: params[:customer_id]).first.rides.first.completed rescue true
      return render json: { success: false, message: "Customer already on a ride"} if !ride_check
    end

    def search_ride
      @cab = []
      cab = Cab.where(available: true, color: params[:color]) if params[:color].present?
      cab = Cab.where(available: true) if params[:color].blank?
      cab.each do |cb|
        return @cab = cb if cb.distance_to(params[:source].split(',').map(&:to_f)) < 5
      end
      return render json: { success: false, message: "No cabs found"} if @cab.blank?
    end

    def ride_params
      params.permit(:customer_id, :cost)
    end
end
