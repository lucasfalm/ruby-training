Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"

  resources :posts
end
