class Api::V1::CabsController < ApplicationController
  respond_to :json
  before_action :set_cab, only: [:update]

  def index
    @cabs = Cab.all
    if @cabs.present?
      render :index
    else
      render json: { success: false, message: 'No Cabs to display' }
    end
  end

  def create
    cab = Cab.new(cab_params)
    if cab.save
      render json: { success: true, message: "Cab added successfully" }
    else
      render json: { success: false, message: cab.errors.messages.flatten.join(" ") }
    end
  end

  def update
    cab = @cab.update(cab_params)
    if cab
      render json: { success: true, message: "Cab updated successfully" }
    else
      render json: { success: false, message: cab.errors.messages.flatten.join(" ") }
    end
  end


  private

  def set_cab
    @cab = Cab.where(id: params[:id]).first
    return json: { success: false, message: "Cab not found"} if @cab.blank?
  end

  def cab_params
    params.permit(:name, :latitude, :longitude, :color)
  end
end
