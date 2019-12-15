class Api::V1::CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/customers
  def index
    @customers = Customer.all
    if @customers.present?
      render :index
    else
      render json: { success: false, message: 'No Cabs to display' }
    end
  end

  # GET /api/v1/customers/1
  def show
  end

  # GET /api/v1/customers/1/edit
  def edit
  end

  # POST /api/v1/customers
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: { success: true, message: "Customer created successfully" }
    else
      render json: { success: false, message: @customer.errors.messages.flatten.join(" ") }
    end
  end

  # PATCH/PUT /api/v1/customers/1
  def update
    if @customer.update(customer_params)
      render json: { success: true, message: "Customer was successfully updated."}
    else
      render json: { success: false, message: @customer.errors.messages.flatten.join(" ") }
    end
  end

  # DELETE /api/v1/customers/1
  def destroy
    @customer.destroy
    render json: { success: true, message: "Customer was successfully deleted."}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.permit(:name, :email)
    end
end
