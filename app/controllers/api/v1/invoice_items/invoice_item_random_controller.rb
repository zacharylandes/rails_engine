class Api::V1::InvoiceItems::InvoiceItemRandomController < ApplicationController


  def show
    binding.pry
    render json: InvoiceItem.order("RANDOM()").first
  end

end
