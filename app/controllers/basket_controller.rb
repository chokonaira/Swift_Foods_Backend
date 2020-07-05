class BasketController < ApplicationController
  def create_basket
    user = User.find_by(:id => params[:user_id])
    if user.present?
      basket = Basket.new(:user_id => user.id)
      basket.save
      render json: { message: "Basket created succesfully", 
                     basket: basket }, 
                     status: 201
    else
      render json: { message: "User does not exist" }, status: 404
    end
  end

  def gets_specific_user_basket
    basket = Basket.find_by(:user_id => params[:user_id])
    if basket.present?
      render json: { message: "Basket details fectch succesfully", 
                     basket: basket, 
                     basket_items: basket.basket_items,
                     product: basket.products }, 
                     status: 200
    else  
      render json: { message: "Oops, this user has no basket, create one first", basket: [] }, status: 200
    end
  end

  private
  def basket_params
    params.require(:basket).permit(:user_id)
  end
end
