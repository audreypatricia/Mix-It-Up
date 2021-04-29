class PlaylistsController < ApplicationController

  def index
    user = RSpotify::User.new(session[:user])
    @playlists = user.playlists
    gon.playlistName = @playlists.first.name
    
  end

end
