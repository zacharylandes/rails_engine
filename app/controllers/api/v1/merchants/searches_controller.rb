class Api::V1::Merchants::SearchesController < ApplicationController

  def index
    #find_all
   render json: Merchant.where(merchant_params)
  end

  def show
    #find
    render json: Merchant.find_by(merchant_params)
  end

  def merchant_params 
    params.permit(:id, :name, :created_at, :updated_at )
  end

  def random
    render json: Merchant.order("RANDOM()").first
  end

end
