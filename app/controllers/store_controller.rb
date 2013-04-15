class StoreController < ApplicationController
  def index
    session[:counter] ||= 0
    session[:counter] += 1
    if (session[:counter] > 5) then
      @count = session[:counter]
    else
      @count = nil
    end
    @products = Product.order(:title)
  end
end
