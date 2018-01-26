class Api::V1::Customers::CustomerRandomController < ApplicationController

  def show
    render json: Customer.order("RANDOM()").first
  end

end
