class Api::V1::Items::SearchesController < ApplicationController
  def index
   render json: Item.where(item_params)
  end

  def show
    #find
    render json: Item.find_by(item_params)
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
