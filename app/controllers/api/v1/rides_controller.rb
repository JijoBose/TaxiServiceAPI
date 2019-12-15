class Api::V1::RidesController < ApplicationController
  before_action :set_api_v1_ride, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/rides
  # GET /api/v1/rides.json
  def index
    @api_v1_rides = Api::V1::Ride.all
  end

  # GET /api/v1/rides/1
  # GET /api/v1/rides/1.json
  def show
  end

  # GET /api/v1/rides/new
  def new
    @api_v1_ride = Api::V1::Ride.new
  end

  # GET /api/v1/rides/1/edit
  def edit
  end

  # POST /api/v1/rides
  # POST /api/v1/rides.json
  def create
    @api_v1_ride = Api::V1::Ride.new(api_v1_ride_params)

    respond_to do |format|
      if @api_v1_ride.save
        format.html { redirect_to @api_v1_ride, notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_ride }
      else
        format.html { render :new }
        format.json { render json: @api_v1_ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/rides/1
  # PATCH/PUT /api/v1/rides/1.json
  def update
    respond_to do |format|
      if @api_v1_ride.update(api_v1_ride_params)
        format.html { redirect_to @api_v1_ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_ride }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/rides/1
  # DELETE /api/v1/rides/1.json
  def destroy
    @api_v1_ride.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_ride
      @api_v1_ride = Api::V1::Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_ride_params
      params.fetch(:api_v1_ride, {})
    end
end
