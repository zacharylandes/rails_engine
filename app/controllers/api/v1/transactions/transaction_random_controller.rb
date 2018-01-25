class Api::V1::Transactions::TransactionRandomController < ApplicationController

  def show
    render json: Transaction.order("RANDOM()").first
  end

end
