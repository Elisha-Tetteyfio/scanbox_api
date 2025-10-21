Rails.application.routes.draw do
  resources :businesses
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users, only: [:index, :show, :update]

  namespace :auth do
    post "/signup", to: "registrations#create"
    post "/login", to: "sessions#create"
    post "/logout", to: "sessions#delete"
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
