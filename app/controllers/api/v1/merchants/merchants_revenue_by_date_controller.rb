class Api::V1::Merchants::MerchantsRevenueByDateController < ApplicationController

  def index
    render json: Invoice.revenue_by_date(params["date"])
  end
end