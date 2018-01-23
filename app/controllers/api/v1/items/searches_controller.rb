class Api::V1::Items::SearchesController < ApplicationController
  def index

   render json: Item.where(params.keys.first => params.values.first)
  end

  def show
    render json: Item.find_by(params.keys.first => params.values.first)
  end

  def random
    render json: Item.order("RANDOM()").first
  end

end
