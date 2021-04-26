require 'rspotify/oauth'

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :spotify, ENV["SPOTIFY_KEY"], ENV["SPOTIFY_SECRET"], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :spotify, ENV["SPOTIFY_KEY"], ENV["SPOTIFY_SECRET"], scope: 'user-top-read user-read-private user-read-email playlist-modify-public user-library-read user-library-modify', show_dialog: 'true', callback_path: '/auth/spotify/callback'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_KEY"], ENV["SPOTIFY_SECRET"], scope: 'playlist-modify-public playlist-modify-private playlist-read-private playlist-read-collaborative user-library-modify user-library-read user-read-email', show_dialog: 'true', callback_path: '/auth/spotify/callback'
end
