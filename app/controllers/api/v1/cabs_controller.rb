class Api::V1::CabsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cab, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/cabs
  def index
    @cabs = Cab.all
    if @cabs.present?
      render :index
    else
      render json: { success: false, message: 'No Cabs to display' }
    end
  end

  # POST /api/v1/cabs
  def create
    cab = Cab.new(cab_params)
    if cab.save
      render json: { success: true, message: "Cab added successfully" }
    else
      render json: { success: false, message: cab.errors.messages.flatten.join(" ") }
    end
  end

  # PATCH/PUT /api/v1/cabs/1
  def update
    cab = @cab.update(cab_params)
    if cab
      render json: { success: true, message: "Cab updated successfully" }
    else
      render json: { success: false, message: cab.errors.messages.flatten.join(" ") }
    end
  end

  # DELETE /api/v1/cabs/1
  def destroy
    @cab.destroy
    render json: { success: true, message: "Cab Deleted"}
  end

  private

    def set_cab
      @cab = Cab.where(id: params[:id]).first
      return render json: { success: false, message: "Cab not found"} if @cab.blank?
    end

    def cab_params
      params.permit(:name, :latitude, :longitude, :color)
    end
end
