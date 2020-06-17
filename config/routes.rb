Rails.application.routes.draw do
  root "welcome#index"
  post "signup" => "user#signup", only: [:create]
  post "login" => "user#login"
  post "product/categories/add" => "category#add_a_category" 
  get "product/categories" => "category#get_all_category" 
  get "product/categories/:id" => "category#get_specific_category_details" 
  patch "product/categories/:id" => "category#update_a_category" 
  delete "product/categories/:id" => "category#delete_a_category"
  post "product/add" => "product#add_a_product" 
  get "product/:id" => "product#get_a_product_details" 
end
