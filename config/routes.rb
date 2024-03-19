Rails.application.routes.draw do
  get 'breed_varity/show'
  resources :breeds do
    resources :breed_varieties
    resources :breed_features
  end
  get 'breed_features/show'
  root 'breeds#index'

  # Other routes
  get 'about', to: 'static_pages#about'
  resources :breeds, only: [:index]
  resources :breeds
  get "up" => "rails/health#show", as: :rails_health_check

end
