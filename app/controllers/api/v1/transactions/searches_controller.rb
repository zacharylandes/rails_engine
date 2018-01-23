class Api::V1::Transactions::SearchesController < ApplicationController
  
  def index
    render json: Transaction.where(params.keys.first => params.values.first)
  end

  def show
    render json: Transaction.find_by(params.keys.first => params.values.first)
  end

end