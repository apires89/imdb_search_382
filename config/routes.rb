Rails.application.routes.draw do
  get 'movies/index'
  root to: 'pages#home'
  resources :movies, only: :index
end
