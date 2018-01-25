class Api::V1::InvoiceItems::SearchesController < ApplicationController
  
  def index
   render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  def invoice_item_params
    params[:unit_price] = (params[:unit_price].to_d*100) if params[:unit_price]
    params.permit(:id ,:item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end




end
