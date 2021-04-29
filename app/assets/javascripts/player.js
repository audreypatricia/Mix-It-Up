$(document).ready(function(){


    tracks = $('.playlist-tracks');

    if(tracks === 0){
      return;
    }

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
        console.log("no music");
        let snackbar = document.getElementById("music-snackbar");
        snackbar.className = "show";
        setTimeout(function(){ snackbar.className = snackbar.className.replace("show", ""); }, 3000);
      })
    }

  }


    // $($(".playlist-tracks")[0]).on("click", function() {
    //   let audio = new Audio(gon.track_previews[0]);
    //   audio.play();
    // });
    //
    // $($(".playlist-tracks")[1]).on("click", function() {
    //   let audio = new Audio(gon.track_previews[1]);
    //   audio.play();
    // });
    //
    // $($(".playlist-tracks")[2]).on("click", function() {
    //   let audio = new Audio(gon.track_previews[2]);
    //   audio.play();
    // });


});
