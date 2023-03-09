Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :journeys, only: :show do
    resources :user_journeys, only: :create
  end
  resources :user_journeys, only: %i[show create]

  resources :user_journey_pieces, only: %i[show] do
    member do
      post :unlock
    end
    resources :user_journey_answers, only: %i[create]
  end

  resources :questions, only: :show
  # resources :pieces, only: :show
  patch 'user_journeys/:id/quit', to: 'user_journeys#quit', as: 'quit'
  get '/qrcode/:slug', to: 'scanner#qr_code', as: 'qr_code'
end
