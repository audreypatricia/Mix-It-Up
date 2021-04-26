data = RSpotify::User.find('audrey.patricia.11')
data2 = RSpotify::User.find('thelifeofshellyyy')

User.destroy_all
u = User.create :username => 'audrey.patricia.11', :password_digest => 'chicken'
u2 = User.create :username => data2.id, :password_digest => 'chicken'
puts "User created"

Playlist.destroy_all
# p = Playlist.create :name => data.playlists.first.name, :image => data.playlists.first.images.first["url"]

playlists =  data.playlists

playlists.each do |playlist|
  p = Playlist.create :name => playlist.name, :image => playlist.images.first["url"]
  u.playlists << p
end

playlists2 = data2.playlists

playlists2.each do |playlist|
  p = Playlist.create :name => playlist.name, :image => playlist.images.first["url"]
  u2.playlists << p
end

puts "#{Playlist.count} playlists created"

Track.destroy_all
# t1 = Track.create :name => data.playlists[0].tracks[0].name, :album_id => data.playlists[0].tracks[0].album.id, :artist_id => data.playlists[0].tracks[0].artists.first.id
#
# t2 = Track.create :name => data.playlists[0].tracks[1].name, :album_id => data.playlists[0].tracks[1].album.id, :artist_id => data.playlists[0].tracks[1].artists.first.id
#
# t3 = Track.create :name => data.playlists[0].tracks[2].name, :album_id => data.playlists[0].tracks[2].album.id, :artist_id => data.playlists[0].tracks[1].artists.first.id
#
# t4 = Track.create :name => data.playlists[0].tracks[3].name, :album_id => data.playlists[0].tracks[3].album.id, :artist_id => data.playlists[0].tracks[3].artists.first.id

playlists.each do |playlist|
  tracks = playlist.tracks
  playlist_name = playlist.name
  tracks.each do |track|
    t = Track.create :name => track.name, :album_id => track.album.id, :artist_id => track.artists.first.id, :image => track.album.images.first["url"]

    (Playlist.find_by_name playlist_name).tracks << t
  end
end

playlists2.each do |playlist|
  tracks = playlist.tracks
  playlist_name = playlist.name
  tracks.each do |track|
    t = Track.create :name => track.name, :album_id => track.album.id, :artist_id => track.artists.first.id, :image => track.album.images.first["url"]

    (Playlist.find_by_name playlist_name).tracks << t
  end
end

puts "#{ Track.count } tracks created"


##### associations #####
# u.playlists << p
# puts "#association between user and playlist made"
#
# p.tracks << t1 << t2 << t3 << t4
# puts "#associations between playlist and tracks made"
