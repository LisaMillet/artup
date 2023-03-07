Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :journeys, only: %i[show]
  resources :user_journeys, only: %i[show create]
  resources :questions, only: :show
end
