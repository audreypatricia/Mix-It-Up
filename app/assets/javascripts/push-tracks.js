$(document).ready(function(){

  if($('.saved_track_item').length === 0){
    $('.add_tracks_options').addClass('hidden');
    info = "<p>Oh no! You didn't save anything... go explore!</p>"
    $(saved_tracks_section).append(info);

  } else {
    $('.add_tracks_options').removeClass('hidden');
  }

  $($('.add_tracks_button')).on("click", function(){
      localStorage.clear();
  });

});
