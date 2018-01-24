class Api::V1::Invoices::SearchesController < ApplicationController
  def index
   render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

  def invoice_params
    params.permit(:id,:customer_id, :status, :merchant_id, :created_at, :updated_at)
  end

  def random
    render json: Invoice.order("RANDOM()").first
  end


end
