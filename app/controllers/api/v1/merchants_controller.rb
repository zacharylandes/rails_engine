class Api::V1::MerchantsController < ApplicationController

  def index
    render json:  Merchant.select("id, name").all
  end

  def show
    render json: Merchant.find_by(merchant_params)
  end

  private 

  def merchant_params 
    params.permit(:id, :name )
  end
end