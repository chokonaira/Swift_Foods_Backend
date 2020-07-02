class BasketController < ApplicationController
  def create_basket
    user = User.find_by(:id => params[:user_id])
    if user.present?
      basket = Basket.new(:user_id => user.id)
      basket.save
      render json: { message: "Basket created succesfully", basket: basket }, status: 401
    else
      render json: { message: "User does not exist" }, status: 404
    end
  end

  private
  def basket_params
    params.require(:basket).permit(:user_id)
  end
end
