$(document).ready(function(){


    tracks = $('.playlist-tracks');

    if(tracks === 0){
      console.log('bye');
      return;
    }

    console.log("yay i'm working");

  for(let i = 0; i < tracks.length; i++){
    let $track = $(tracks[i]);
    let audio = new Audio(gon.track_previews[i]);
    $track.hover(function(){
      audio.load();
      audio.play();
    }, function(){
      audio.pause();
    });
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
