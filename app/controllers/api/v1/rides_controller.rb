class Api::V1::RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

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
    if @ride.save
      render json: { success: true, message: 'Ride was successfully created.' }
    else
      render json: { success: false, message: @ride.errors.messages.flatten.join(" ")}
    end
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
    def set_api_v1_ride
      @ride = Ride.find(params[:id])
    end

    def ride_params
      params.permit(:customer_id, :cab_id, :source, :destination, :cost, :completed)
    end
end
