class BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show update destroy ]

  # GET /businesses
  def index
    @businesses = Business.all

    render json: @businesses
  end

  # GET /businesses/1
  def show
    render json: @business
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)
    @business.created_by = current_user

    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: @business.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      render json: @business
    else
      render json: @business.errors, status: :unprocessable_content
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.expect(business: [ :name, :email, :phone_number ])
    end
end
