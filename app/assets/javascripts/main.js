


$(document).ready(function(){

// testing gon
  playlistName = gon.playlistName

  $('.logout').click(function(){
    const url = 'https://accounts.spotify.com/en/logout'
    const spotifyLogoutWindow = window.open(url, 'Spotify Logout', 'width=700,height=500,top=40,left=40')
    window.location.href = 'http://localhost:3000/';
    setTimeout(() => spotifyLogoutWindow.close(), 1000);
    localStorage.clear();
  });

});
