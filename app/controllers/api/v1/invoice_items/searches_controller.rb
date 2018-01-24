class Api::V1::InvoiceItems::SearchesController < ApplicationController
  def index
<<<<<<< HEAD
   render json: InvoiceItem.where(params.keys.first => params.values.first)
  end

  def show
    render json: InvoiceItem.find_by(params.keys.first => params.values.first)
=======
    #find_all
   render json: InvoiceItem.where(invoice_item_params)
  end

  def show

    #find
    render json: InvoiceItem.find_by(invoice_item_params)
  end

    def invoice_item_params
    params.permit(:id ,:item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
>>>>>>> 7719ec3c63200d58f2182203d84bf3ace478f48a
  end

  def random
    render json: InvoiceItem.order("RANDOM()").first
  end


end
