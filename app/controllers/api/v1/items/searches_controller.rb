class Api::V1::Items::SearchesController < ApplicationController
  def index
<<<<<<< HEAD

   render json: Item.where(params.keys.first => params.values.first)
  end

  def show
    render json: Item.find_by(params.keys.first => params.values.first)
  end

  def random
    render json: Item.order("RANDOM()").first
  end
=======
    #find_all
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

>>>>>>> 7719ec3c63200d58f2182203d84bf3ace478f48a

end
