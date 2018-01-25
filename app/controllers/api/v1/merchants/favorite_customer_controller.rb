class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  
  def index
    render json: Invoice.find_by(merchant_id => params[:id]).customers_with_pending_invoices(Merchant.find(params[:id]))
  end

  def show
    render json: Merchant.find(params[:id]).favorite_customer
  end

end