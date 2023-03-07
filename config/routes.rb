Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :journeys, only: :show do
    resources :user_journeys, only: :create
  end
  resources :user_journeys, only: %i[show create] do
    resources :user_journey_answers, only: %i[create]
    resources :pieces, only: :show, controller: 'user_journeys/pieces'
  end
  resources :questions, only: :show
  resources :pieces, only: :show
  patch 'user_journeys/:id/quit', to: 'user_journeys#quit', as: 'quit'
end
