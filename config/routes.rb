Rails.application.routes.draw do
  root "welcome#index"
  post "signup" => "user#create", only: [:create]
  post "category/add" => "category#add" 

end
