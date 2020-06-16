Rails.application.routes.draw do
  root "welcome#index"
  post "signup" => "user#signup", only: [:create]
  post "login" => "user#login"
  post "product/categories/add" => "category#add" 
  get "product/categories" => "category#get_all" 
  patch "product/categories/:id" => "category#update" 
  delete "product/categories/:id" => "category#delete"
  post "product/add" => "product#add" 
end
