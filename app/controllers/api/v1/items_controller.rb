class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.select("id, name, description, unit_price, merchant_id").all
  end

  def show
    item = Item.find_by(item_params)
    item["unit_price"] = unit_price_conversion(item["unit_price"])
    render json: item
  end

private

  def item_params
    params.permit(:id,:name, :description, :unit_price, :merchant_id)
  end
end
