Rails.application.routes.draw do
  root "welcome#index"
  post "signup" => "user#signup", only: [:create]
  post "login" => "user#login"
  post "category/add" => "category#add" 
end
