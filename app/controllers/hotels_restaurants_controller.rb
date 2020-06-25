class HotelsRestaurantsController < ApplicationController
  # validate :no_multi_day_events
  def add_a_restaurant
    @restaurant = HotelsRestaurant.new(restaurant_params)

    if @restaurant.valid?
      existing_restaurant = HotelsRestaurant.find_by(:name => params[:name])
      if existing_restaurant.present?
        render json: { message: "Restaurant: " + params[:name] + " already exist" }, 
                        status: 401
      else
        @restaurant.save
        render json: { message: "Restaurant: " + params[:name] + ", added succesfully", 
                      id: @restaurant.id}, 
                      status: 201
      end
    else
      render json: @restaurant.errors.details, status: 500
    end
  end

  def get_all_restaurants
    restaurants = HotelsRestaurant.all.order(:id)
    if restaurants
      render json: { message: "Restaurants fetched succesfully", hotels_restaurants: restaurants }, status: 200
    else
      render json: { message: "Restaurant empty", restaurants: [] }, status: 203
    end
  end

  def get_specific_restaurant_details
    restaurant = HotelsRestaurant.find_by(:id => params[:id])
    if restaurant
      render json: { message: "Restaurant detail fetched succesfully", 
                     restaurant: restaurant, 
                     categories: restaurant.categories },
                     status: 200
    else
      render json: { message: "Restaurant empty" }, status: 203
    end
  end


  def update_a_restaurant_details
    restaurant = HotelsRestaurant.find_by(:id => params[:id])
    if restaurant 
      restaurant_name = {:name => params[:name]}
      restaurant.update(restaurant_params)
      render json: { message: "Restaurant detail updated succesfully", 
                     restaurant: restaurant }, status: 200
    else
      render json: { message: "Restaurant does not exist" }, status: 404
    end
  end

  private
  def restaurant_params
    params.require(:hotels_restaurant).permit(:name, :address)
  end
end
