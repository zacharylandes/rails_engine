class Api::V1::Merchants::SingleMerchantRevenueController < ApplicationController
  def show
    if params["date"]
      render json: Merchant.find(params[:id]).single_merchant_revenue_by_date(params["date"])
    else 
      render json: Merchant.find(params[:id]).single_merchant_revenue
    end
  end

end