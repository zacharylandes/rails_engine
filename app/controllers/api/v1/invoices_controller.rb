class Api::V1::InvoicesController < ApplicationController
  def index
    render json: Invoice.select("id, customer_id, status, merchant_id").all
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

private

  def invoice_params
    params.permit(:id,:customer_id, :status, :merchant_id)
  end
end
