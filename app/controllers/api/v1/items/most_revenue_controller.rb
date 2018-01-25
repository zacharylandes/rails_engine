class Api::V1::Items::MostRevenueController < ApplicationController

  def index
   render json:  Item.most_revenue(params["quantity"])
  end

  def show
   render json:  Item.find(params[:id]).best_day
  end


end
