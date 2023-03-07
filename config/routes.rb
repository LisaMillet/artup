Rails.application.routes.draw do
  get 'user_journey_answers/create'
  root to: "pages#home"
  resources :journey, only: %i[show]
  resources :user_journeys, only: %i[show create] do
    resources :user_journey_answers, only: %i[create]
  end
  resources :questions, only: :show
end
