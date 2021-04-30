
$(document).ready(function(){

  $('.create_playlist').attr("placeholder", "New playlist name");

// get saved track data on every page
  if(localStorage.getItem("saved_uris") === null){
    saved_uris = [];
    saved_track_names = [];
    saved_artist = [];
    saved_images = []
  } else{
    saved_uris = JSON.parse(localStorage.getItem("saved_uris"));
    saved_track_names = JSON.parse(localStorage.getItem("saved_track_names"));
    saved_artist = JSON.parse(localStorage.getItem("saved_artist"));
    saved_images = JSON.parse(localStorage.getItem("saved_images"));
  }



  tracks = $('.playlist-tracks');

  if(tracks.length === 0){
    return;
  }

// setting a click event listener, when they click on tracks this data gets pushed onto saved tracks and then sets it again on local storage
  for(let i = 0; i < tracks.length; i++){
    let $track = $(tracks[i]);
    $track.on('click', function(){
      saved_uris.push(gon.track_uris[i]);
      saved_track_names.push(gon.track_names[i]);
      saved_artist.push(gon.track_artist[i])
      saved_images.push(gon.track_images[i])
      localStorage.setItem("saved_uris", JSON.stringify(saved_uris));
      localStorage.setItem("saved_track_names", JSON.stringify(saved_track_names));
      localStorage.setItem("saved_artist", JSON.stringify(saved_artist));
      localStorage.setItem("saved_images", JSON.stringify(saved_images));

      let snackbar = document.getElementById("track-snackbar");
      snackbar.className = "show";
      setTimeout(function(){ snackbar.className = snackbar.className.replace("show", ""); }, 3000);
    });
  }



});
