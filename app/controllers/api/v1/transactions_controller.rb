class Api::V1::TransactionsController < ApplicationController

  def index
    render json: Transaction.select("id, invoice_id, credit_card_number, credit_card_expiration_date, result").all
  end

  def show
    render json: Transaction.find_by(transaction_params)
  end

  private 

  def transaction_params 
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result)
  end
end