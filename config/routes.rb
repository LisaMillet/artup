Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :journeys, only: %i[show] do
    resources :user_journeys, only: :create
  end
  resources :user_journeys, only: %i[show]
  resources :questions, only: :show
end
