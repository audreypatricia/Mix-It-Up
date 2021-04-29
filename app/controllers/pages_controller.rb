class PagesController < ApplicationController
  def home
    @spotify_user = RSpotify::User.new(session[:user]) if session[:user].present?

  end


  def spotify

  @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  @playlists = @spotify_user.playlists

  end
end
