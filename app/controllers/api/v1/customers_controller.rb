class Api::V1::CustomersController < ApplicationController

  def index
    render json: Customer.select("id, first_name, last_name").all
  end

  def show
    render json: Customer.find_by(customer_params)
  end

  private 

  def customer_params 
    params.permit(:id, :first_name, :last_name )
  end
end