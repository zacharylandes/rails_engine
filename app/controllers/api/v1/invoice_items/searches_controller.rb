class Api::V1::InvoiceItems::SearchesController < ApplicationController
  def index
   render json: InvoiceItem.where(params.keys.first => params.values.first)
  end

  def show
    render json: InvoiceItem.find_by(params.keys.first => params.values.first)
  end

  def random
    render json: InvoiceItem.order("RANDOM()").first
  end


end
