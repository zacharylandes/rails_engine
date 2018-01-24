class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItem.select("id, item_id, invoice_id, quantity,unit_price").all
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end
end
