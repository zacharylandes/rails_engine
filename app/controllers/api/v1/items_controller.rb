class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.select("id, name, description, unit_price, merchant_id").all
  end

  def show
    item = Item.find_by(item_params)
    item["unit_price"] = unit_price_conversion(item["unit_price"])
    render json: item
  end

  # def unit_price_to_dollars(price)
  #   binding.pry
  #   (price / 100)
  # end


private

  def item_params
    # params[:unit_price] = (params[:unit_price].to_d*100) if params[:unit_price]
    params.permit(:id,:name, :description, :unit_price, :merchant_id)
  end
end
