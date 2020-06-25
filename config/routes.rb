Rails.application.routes.draw do
  get 'hotels_restaurants/add'
  root "welcome#index"
  post "signup" => "user#signup", only: [:create]
  post "login" => "user#login"
  post "products/categories/add" => "category#add_category" 
  get "products/categories" => "category#get_all_category" 
  get "products/categories/:id" => "category#get_specific_category_details" 
  patch "products/categories/:id" => "category#update_a_category" 
  delete "products/categories/:id" => "category#delete_a_category"
  post "products/add" => "product#add_a_product" 
  get "products/:id" => "product#get_a_product_details" 
  get "products" => "product#get_all_products"
  patch "products/update/:id" => "product#update_a_product_details"
  patch "products/image/:id" => "product#update_food_image"
  delete "products/:id" => "product#delete_a_product"
  post "hotels_restaurants/add" => "hotels_restaurants#add_a_hotel_and_restaurant" 
  get "hotels_restaurants" => "hotels_restaurants#get_all_hotel_and_restaurant" 
  get "hotels_restaurants/:id" => "hotels_restaurants#get_specific_hotel_and_restaurant_details"
end
