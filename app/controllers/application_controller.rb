class ApplicationController < ActionController::API


  def unit_price_conversion(price)
    price.to_f/100
  end

end
