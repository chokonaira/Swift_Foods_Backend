class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token

  def checkout_a_basket
    basket = Basket.find_by(:user_id => params[:user_id])
    if basket.present?
      checkout = Checkout.new(checkout_params)
      checkout.save
      render json: { message: "Checkout succesfull", checkout: checkout }, status: 201
    else
      render json: { message: "Oops, this user has no basket, create one first", basket: [] }, status: 200
    end
  end

  private
  def checkout_params
    params.require(:checkout).permit(:user_id, :basket_id, :full_name, :delivery_address, :payment_verified, :phone)
  end
end
