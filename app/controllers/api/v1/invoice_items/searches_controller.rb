class Api::V1::InvoiceItems::SearchesController < ApplicationController
  def index
    #find_all
   render json: InvoiceItem.where(params.keys.first => params.values.first)
  end

  def show

    #find
    render json: InvoiceItem.find_by(params.keys.first => params.values.first)
  end

end
