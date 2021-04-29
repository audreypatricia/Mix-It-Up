class CreateController < ApplicationController

  def create
    user = RSpotify::User.new(session[:user]);
    playlists = user.playlists

    editable_playlists= []

    playlists.each do |playlist|
      if playlist.owner.id == user.id
        editable_playlists.push(playlist)
      end
    end

    @option_for_select = [];

    editable_playlists.each do |playlist|
      playlist_name = playlist.name
      @option_for_select << playlist_name
    end

  end


  def playlist

    selected_playlist = params[:playlist]
    track_uris = params[:track_uris]

    # manipulate track_uri string into an array
    track_uris = track_uris.split(',')
      
    # get user
    user = RSpotify::User.new(session[:user]);

    user_playlists = user.playlists

    playlist_id = ""

    # find the playlist they selected
    user_playlists.each do |playlist|
      if playlist.name == selected_playlist
        playlist_id = playlist.id
        break
      end
    end

    # push the new tracks into playlist
    playlist =  RSpotify::Playlist.find(session[:user]["info"]["id"], playlist_id)
    playlist.add_tracks!(track_uris)


    redirect_to save_path
  end

end
