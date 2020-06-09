Rails.application.routes.draw do
  root "welcome#index"
  post "signup" => "user#create", only: [:create]
  
end
