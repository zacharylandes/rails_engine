class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItem.select("id, item_id, invoice_id, quantity,unit_price").all
  end

  def show
    invoice_item = InvoiceItem.find_by(invoice_item_params)
    invoice_item["unit_price"] = unit_price_conversion(invoice_item["unit_price"])
    render json: invoice_item
  end



private

  def invoice_item_params
    params[:unit_price] = unit_price_conversion(params[:unit_price]) if params[:unit_price]
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end
end
