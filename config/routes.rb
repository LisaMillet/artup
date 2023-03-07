Rails.application.routes.draw do
  root to: "pages#home"
  resources :journey, only: %i[show]
  resources :user_journeys, only: %i[show create]
  resources :questions, only: :show
end
