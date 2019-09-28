Rails.application.routes.draw do
  get '/songs/index', to: 'songs#index'
  resources :songs, only: [:show, :new, :create, :edit, :update, :destroy]
  get '/songs', to: 'songs#index'
end
