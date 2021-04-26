class PlaylistsController < ApplicationController

  def index
    user = RSpotify::User.new(session[:user])
    @playlists = user.playlists
    raise 'hell'
  end

#will be where users create new playlists
  def new
  end

  def create
  end

#users will not have the ability to delete playlists

  def update
   #users will be able to add new songs into their existing playlists
  end

end
