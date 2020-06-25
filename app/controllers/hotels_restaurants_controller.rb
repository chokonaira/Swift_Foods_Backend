class HotelsRestaurantsController < ApplicationController
  def add_a_hotel_and_restaurant
    @hotel_restaurant = HotelsRestaurant.new(hotel_restaurant_params)

    if @hotel_restaurant.valid?
      existing_hotel_restaurant = HotelsRestaurant.find_by(:name => params[:name])
      if existing_hotel_restaurant.present?
        render json: { message: "Hotels or Restaurant: " + params[:name] + " already exist" }, 
                        status: 401
      else
        @hotel_restaurant.save
        render json: { message: "Hotels or Restaurant: " + params[:name] + ", added succesfully", 
                      id: @hotel_restaurant.id}, 
                      status: 201
      end
    else
      render json: @hotel_restaurant.errors.details, status: 500
    end
  end

  def get_all_hotel_and_restaurant
    hotel_restaurants = HotelsRestaurant.all.order(:id)
    if hotel_restaurants
      render json: { message: "Hotels or Restaurant fetched succesfully", hotels_restaurants: hotel_restaurants }, status: 200
    else
      render json: { message: "Hotels or Restaurant empty", hotel_restaurants: [] }, status: 203
    end
  end

  private
  def hotel_restaurant_params
    params.require(:hotels_restaurant).permit(:name, :address)
  end
end
