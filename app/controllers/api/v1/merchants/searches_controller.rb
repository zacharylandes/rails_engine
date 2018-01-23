class Api::V1::Merchants::SearchesController < ApplicationController

  def index
    #find_all
   render json: Merchant.where(params.keys.first => params.values.first)
  end

  def show
    #find
    render json: Merchant.find_by(params.keys.first => params.values.first)
  end

  def random
    render json: Merchant.order("RANDOM()").first
  end

end
