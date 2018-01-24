class Api::V1::InvoiceItems::SearchesController < ApplicationController
  def index
    #find_all
   render json: InvoiceItem.where(invoice_item_params)
  end

  def show

    #find
    render json: InvoiceItem.find_by(invoice_item_params)
  end

    def invoice_item_params
    params.permit(:id ,:item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end
