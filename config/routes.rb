Rails.application.routes.draw do
  get 'movies/index'
  root to: 'pages#home'

  get 'search', to: 'pages#search', as: 'search'
  resources :movies, only: :index
end
