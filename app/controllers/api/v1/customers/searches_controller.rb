class Api::V1::Customers::SearchesController < ApplicationController

  def index
    render json: Customer.where(params.keys.first => params.values.first)
  end

  def show
    render json: Customer.find_by(params.keys.first => params.values.first)
  end

  def random
    render json: Customer.order("RANDOM()").first
  end


end
