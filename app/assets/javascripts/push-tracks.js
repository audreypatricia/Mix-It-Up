$(document).ready(function(){

  if($('.saved_track_item').length === 0){
    $('.add_tracks_button').addClass('hidden');
    $('#playlist').addClass('hidden');
    info = "<p>Oh no! You didn't save anything... go explore!</p>"
    $(saved_tracks_section).append(info);

  } else {
    $('.add_tracks_button').removeClass('hidden');
    $('#playlist').removeClass('hidden');

  }

  $($('.add_tracks_button')).on("click", function(){
      localStorage.clear();
  });

});
