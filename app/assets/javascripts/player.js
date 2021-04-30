$(document).ready(function(){

// get all elements that should play music
    tracks = $('.playlist-tracks');

    if(tracks === 0){
      return;
    }

// putting hover event listeners to each element
  for(let i = 0; i < tracks.length; i++){
    let $track = $(tracks[i]);
    if(gon.track_previews[i] != null){
      let audio = new Audio(gon.track_previews[i]);
      $track.hover(function(){
        audio.load();
        audio.play();
      }, function(){
        audio.pause();
      });
    } else {
      $track.hover(function(){
        // reveals "no music to display" snackbar when the track_preview is nil
        console.log("no music");
        let snackbar = document.getElementById("music-snackbar");
        snackbar.className = "show";
        setTimeout(function(){ snackbar.className = snackbar.className.replace("show", ""); }, 3000);
      })
    }

  }

});
