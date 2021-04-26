Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/auth/spotify/callback', to: 'users#index'

  # resources :users, :only => [:index, :new, :create]
  resources :playlists, :only => [:index]
  resources :tracks, :only => [:index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/discover' => 'discover#show'


end
