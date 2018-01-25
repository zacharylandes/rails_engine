class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def index
    render json: Customer.pending_invoices(params[:id])
  end

  def show
    render json: Merchant.find(params[:id]).favorite_customer
  end

end
