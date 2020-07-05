class CheckoutController < ApplicationController
  def checkout_a_basket
    basket = Basket.find_by(:user_id => params[:user_id])
    if basket.present?
      checkout = Checkout.new(checkout_params)
      checkout.save
      p"=="*30
      p checkout
      p"=="*30

      render json: { message: "Checkout succesfull", checkout: checkout }, status: 201
    else
      render json: { message: "Oops, this user has no basket, create one first", basket: [] }, status: 200
    end
  end

  private
  def checkout_params
    params.permit(:user_id, :basket_id, :full_name, :delivery_address, :payment_verified, :phone)
  end
end
