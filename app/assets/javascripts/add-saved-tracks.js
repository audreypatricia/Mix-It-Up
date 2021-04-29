$(document).ready(function(){

  saved_tracks_section = $('#saved-tracks');

  if(saved_tracks_section.length === 0){
    return;
  }


  console.log("hello saved track section")

  saved_uris = JSON.parse(localStorage.getItem("saved_uris"));
  saved_track_names = JSON.parse(localStorage.getItem("saved_track_names"));
  saved_artist = JSON.parse(localStorage.getItem("saved_artist"));
  saved_images = JSON.parse(localStorage.getItem("saved_images"));

  if (JSON.parse(localStorage.getItem("saved_uris")) != null) {
    for (i = 0; i < saved_track_names.length; i++) {

      img = `<img src="${saved_images[i]}" class="saved_images">`
      element = `<li class="saved_track_item">${saved_track_names[i]} <p class="saved_track_artist"><em> by ${saved_artist[i]}</em></p></li>`
      button = `<button class="btn btn-outline-danger btn-sm remove", id= "${i}">remove</button>`
      br = `<br></br>`
      $(saved_tracks_section).append(img, element, button, br);

    }
  }



  let remove_saved = function(arr, index){
    array1 = arr.slice(0, index);
    console.log(array1);
    array2 = arr.slice(parseInt(index) + 1);
    console.log(array2);
    finalArray = array1.concat(array2);
    return finalArray;
  }

  remove_buttons = $('.remove');
  for(let i = 0; i < remove_buttons.length; i++){

    $(remove_buttons[i]).on("click", function(){
      id = $(remove_buttons[i]).attr("id");
      console.log(id)
      saved_uris = remove_saved(saved_uris, id);
      saved_track_names = remove_saved(saved_track_names, id);
      saved_artist = remove_saved(saved_artist, id);
      saved_images = remove_saved(saved_images, id);

      localStorage.setItem("saved_uris", JSON.stringify(saved_uris));
      localStorage.setItem("saved_track_names", JSON.stringify(saved_track_names));
      localStorage.setItem("saved_artist", JSON.stringify(saved_artist));
      localStorage.setItem("saved_images", JSON.stringify(saved_images));

      window.location.reload()
    });
  }

  $($("#track_uris")).val(JSON.parse(localStorage.getItem("saved_uris")))


// $($('.add_to_existing_playlist')).on("click", function(){
//   let playlist_choice = $('#playlist').children("option:selected").val();
//
// });



});
