class DiscoverController < ApplicationController

  def show
    #find the artist
    artist_id = params[:id]
    artist = RSpotify::Artist.find(artist_id)
    #get their albums
    @albums = artist.albums(limit: 5, country:'AU')

    #get their songs
    @top_tracks = artist.top_tracks('AU')

    track_music = []
    track_uris = []
    track_names = []
    track_artist =[]
    track_images = []

    @top_tracks.each do |track|
      track_music.push(track.preview_url)
      track_uris.push(track.uri)
      track_names.push(track.name)
      track_artist.push(track.artists.first.name)
      track_images.push(track.album.images.first["url"])
    end

    gon.track_previews = track_music
    gon.track_uris = track_uris
    gon.track_names = track_names
    gon.track_artist = track_artist
    gon.track_images = track_images

    #get related artist
    related_artist = artist.related_artists
    @related_artist = []
    while @related_artist.length < 5
      @related_artist.push(related_artist.sample)
      @related_artist.uniq!
    end


  end


  def albums
    album_id = params[:id]
    @album = RSpotify::Album.find(album_id)
    @tracks = @album.tracks

    album_track_previews = []
    track_uris = []
    track_names = []
    track_artist =[]
    track_images = []

    @tracks.each do |track|
      album_track_previews.push(track.preview_url)
      track_uris.push(track.uri)
      track_names.push(track.name)
      track_artist.push(track.artists.first.name)
      track_images.push(track.album.images.first["url"])
    end

    gon.track_previews = album_track_previews
    gon.track_uris = track_uris
    gon.track_names = track_names
    gon.track_artist = track_artist
    gon.track_images = track_images

  end

  def artist
    artist_id = params[:id]
    @artist = RSpotify::Artist.find(artist_id)
    @top_tracks = @artist.top_tracks('AU')

    artist_top_tracks = []
    track_uris = []
    track_names = []
    track_artist =[]
    track_images = []

    @top_tracks.each do |track|
      artist_top_tracks.push(track.preview_url)
      track_uris.push(track.uri)
      track_names.push(track.name)
      track_artist.push(track.artists.first.name)
      track_images.push(track.album.images.first["url"])
    end

    gon.track_previews = artist_top_tracks
    gon.track_uris = track_uris
    gon.track_names = track_names
    gon.track_artist = track_artist
    gon.track_images = track_images


  end

end
