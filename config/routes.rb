Rails.application.routes.draw do
  resources :movies, only: [:index, :new, :create, :edit, :update]
  root to: 'movies#index'
end
