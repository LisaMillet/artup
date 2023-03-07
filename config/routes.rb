Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :journey, only: %i[show]
  resources :questions, only: :show
  resources :user_journeys, only: %i[show create] do
    resources :user_journey_answers, only: %i[create]
  end
end
