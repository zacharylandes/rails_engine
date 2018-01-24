class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.select("id, name, description, unit_price, merchant_id").all
  end

  def show
    render json: Item.find_by(item_params)
  end


private

  def item_params
    params.permit(:id,:name, :description, :unit_price, :merchant_id)
  end
end
