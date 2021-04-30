# Mix-It-Up

This is an application that uses the Spotify API to help users quickly discover new music based on their current Spotify playlists and taste. Once new tracks are discovered, they can quickly add these to any of their editable personal playlists or create a new playlist for these tracks.

The application can be viewed here:
https://lit-castle-27975.herokuapp.com/

![preview of the app](app/assets/images/app_preview.png)

Sign in with your Spotify account through Spotify's authorisation process and start exploring new sounds

## Motivation

I am halfway through my bootcamp class and we have learnt how the front-end and back-end of web applications work. This project is my opportunity to segment what I have learnt in the past 5 weeks and put it all together to create a full-stack application that people would love using.

## Technology Stack/ Frameworks used
This project uses **Ruby on Rails** for its back-end processes to create views where it calls on the **Spotify API** to display data. On the front-end side of things, **HTML, CSS, Javascript** is used alongside the **JQuery** library to interact with DOM elements. Lastly, I used **Bootstrap** to create the layout of the pages.

Tech Stack:
* Ruby on Rails (v 5.2.5)
  * RSpotify gem
  * gon gem
* Spotify API
* HTML
* CSS
  * Bootstrap framework
* Javascript
  * JQuery library


## Features
* Logging on/out to user's Spotify account
* View their saved playlists
* View tracks within each of their playlists
* Listen to track previews when track covers are hovered over
* Discover more music through clicking tracks
* Save tracks by clicking on track images
* Add discovered tracks into user's current editable playlists
* Create new Spotify playlists and add discovered tracks into them

## How to use

Have fun with the application here: https://lit-castle-27975.herokuapp.com/

Log on with your Spotify account and go on a music adventure. Don't forget to Logout when you're done!

## Future Improvements

* Adding further functionality
  * Ability to save albums
  * Ability to discover music from charts
  * Ability to discover music by genre
* Creating a mini-twitter platform where users on the application share their music discoveries

## Code Example

I loved the gon gem because it allowed me to pass music preview URLs from the Spotify API taken by ruby into Javascript, where I could make it so that when a song is hovered over, music plays.

Ruby side of pulling the data and passing it to javascript:

``` Ruby
def pass_to_gon(tracks)
  track_music = []
  track_uris = []
  track_names = []
  track_artist =[]
  track_images = []

  tracks.each do |track|
    track_music.push(track.preview_url)
    track_uris.push(track.uri)
    track_names.push(track.name)
    track_artist.push(track.artists.first.name)
    track_images.push(track.album.images.first["url"])

    gon.track_previews = track_music
    gon.track_uris = track_uris
    gon.track_names = track_names
    gon.track_artist = track_artist
    gon.track_images = track_images
  end

  ```

Javascript side of receiving the data and setting up a hover event listener:

  ``` Javascript
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

  ```




## Special Thanks ❤️

Special thanks to @Joel Turnbull (a.k.a the Blade) for helping with the dreaded OmniAuth and helping me understand the concept of passing data around from Ruby to Javascript and back to Ruby. Another special thanks to @Mai Nguyen (little-chi-mai) for helping me with deployment and bugs.
