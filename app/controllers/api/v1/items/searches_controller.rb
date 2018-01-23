class Api::V1::Items::SearchesController < ApplicationController
  def index
    #find_all
   render json: Item.where(params.keys.first => params.values.first)
  end

  def show

    #find
    render json: Item.find_by(params.keys.first => params.values.first)
  end

end
