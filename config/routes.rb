Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/auth/spotify/callback', to: 'users#index'

  resources :playlists, :only => [:index]
  resources :tracks, :only => [:index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/discover' => 'discover#show'
  get 'discover/albums' => 'discover#albums'
  get 'discover/artist' => 'discover#artist'

  get '/save' => 'create#create'
  post '/save' => 'create#playlist'
  get '/success' => 'create#success'

end
