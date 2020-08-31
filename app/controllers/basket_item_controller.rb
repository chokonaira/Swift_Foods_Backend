class BasketItemController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add_basket_item
    basket_item = BasketItem.new(basket_item_params)
    if basket_item.valid? 
      basket_item.save
      render json: { message: "Product added to Basket", basket_item: basket_item }, status: 201
    else
      render json: basket_item.errors.details, status: 500
    end
  end
  def get_a_basket_item
    basket_item = BasketItem.find_by(:id => params[:id])
    if basket_item.present?
      render json: { message: "Basket Item fetched succesfully", basket_item: basket_item, basket_item_product: basket_item.product }, status: 200
    else
      render json: basket_item.errors.details, status: 401
    end
  end
  def delete_a_basket_item
    basket_item = BasketItem.find_by(:id => params[:id])
    if basket_item.present?
      BasketItem.delete(basket_item)
      render json: { message: "Basket Item deleted succesfully" }, status: 200
    else
      render json: { message: "Basket Item does not exist" }, status: 404
    end
  end
  def delete_all_basket_items
    basket_items = BasketItem.all.order(:id)
    if basket_items.present?
      BasketItem.delete(basket_items)
      render json: { message: "Basket Items deleted succesfully" }, status: 200
    else
      render json: { message: "Basket Items does not exist" }, status: 404
    end
  end
  private
  def basket_item_params
    params.permit(:basket_id, :product_id, :quantity)
  end
end
