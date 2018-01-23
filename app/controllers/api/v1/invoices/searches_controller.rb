class Api::V1::Invoices::SearchesController < ApplicationController
  def index
   render json: Invoice.where(params.keys.first => params.values.first)
  end

  def show
    render json: Invoice.find_by(params.keys.first => params.values.first)
  end

  def random
    render json: Invoice.order("RANDOM()").first
  end


end
