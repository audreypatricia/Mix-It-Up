class PagesController < ApplicationController
  def home

  end


  def spotify

  @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  @playlists = @spotify_user.playlists

  end
end
