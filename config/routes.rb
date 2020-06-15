Rails.application.routes.draw do
  root "welcome#index"
  post "signup" => "user#signup", only: [:create]
  post "login" => "user#login"
  post "categories/add" => "category#add" 
  get "categories" => "category#get_all" 
end
