class Api::V1::Merchants::MerchantsItemsController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).items
  end

end