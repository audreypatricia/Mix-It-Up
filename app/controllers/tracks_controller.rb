class TracksController < ApplicationController

  def index
    # playlist_id = params[:id]
    # @current_playlist = Playlist.find playlist_id
    # @tracks = @current_playlist.tracks
    user = RSpotify::User.new(session[:user])
    playlist_id = params[:format]
    @playlist = RSpotify::Playlist.find(user.id, playlist_id)
    @tracks = @playlist.tracks
  end

end
