class Api::V1::Items::SearchesController < ApplicationController

  def index
   render json: Item.where(item_params)
  end

  def show
    render json: Item.order('id ASC').find_by(item_params)
  end

  private

  def item_params
    params[:unit_price] = (params[:unit_price].to_d*100) if params[:unit_price]
    params[:created_at] = DateTime.parse(params[:created_at]).utc if params[:created_at]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
