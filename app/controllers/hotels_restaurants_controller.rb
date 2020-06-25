class HotelsRestaurantsController < ApplicationController
  # validate :no_multi_day_events
  def add_a_hotel_and_restaurant
    @hotel_restaurant = HotelsRestaurant.new(hotel_restaurant_params)

    if @hotel_restaurant.valid?
      existing_hotel_restaurant = HotelsRestaurant.find_by(:name => params[:name])
      if existing_hotel_restaurant.present?
        render json: { message: "Hotels and Restaurant: " + params[:name] + " already exist" }, 
                        status: 401
      else
        @hotel_restaurant.save
        render json: { message: "Hotels and Restaurant: " + params[:name] + ", added succesfully", 
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
      render json: { message: "All Hotels and Restaurants fetched succesfully", hotels_restaurants: hotel_restaurants }, status: 200
    else
      render json: { message: "Hotels and Restaurant empty", hotel_restaurants: [] }, status: 203
    end
  end

  def get_specific_hotel_and_restaurant_details
    hotel_restaurant = HotelsRestaurant.find_by(:id => params[:id])
    if hotel_restaurant
      render json: { message: "Hotels and Restaurant detail fetched succesfully", 
                     hotel_restaurant: hotel_restaurant, 
                     categories: hotel_restaurant.categories },
                     status: 200
    else
      render json: { message: "Hotels and Restaurant empty" }, status: 203
    end
  end

  private
  def hotel_restaurant_params
    params.require(:hotels_restaurant).permit(:name, :address)
  end
end
