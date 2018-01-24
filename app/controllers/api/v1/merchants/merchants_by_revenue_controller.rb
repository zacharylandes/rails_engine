class Api::V1::Merchants::MerchantsByRevenueController < ApplicationController
  def index
    render json: Merchant.top_revenue_earners(params["quantity"])
  end

end