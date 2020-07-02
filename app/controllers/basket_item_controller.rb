class BasketItemController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add_basket_item
    basket_item = BasketItem.new(basket_item_params)
    if basket_item.valid?
      basket_item.save
      render json: { message: "Product added to Basket", basket_item: basket_item }, status: 201
    else
      render json: basket_item.errors.details, status: 401
    end
  end


  private
  def basket_item_params
    params.permit(:basket_id, :product_id, :quantity)
  end
end
