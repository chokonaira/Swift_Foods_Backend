class BasketItemController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add_basket_item
    existing_basket_product = BasketItem.find_by(:product_id => params[:product_id])
    if existing_basket_product.present?
      existing_basket_product.update(:quantity => params[:quantity])
      render json: { message: "Product quantity updated succesfully", basket_item: existing_basket_product }, status: 200
    else
      basket_item = BasketItem.new(basket_item_params)
      basket_item.save
      render json: { message: "Product added to Basket", basket_item: basket_item }, status: 201
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
