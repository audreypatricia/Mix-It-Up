console.log("hello")

// audio = new Audio('https://p.scdn.co/mp3-preview/905eb6019a94be6a3f637ac5c6c3521abdc56c28?cid=9fec3533ed784157ae0ede2d30fcdc02');

// audio.play();
// $('.test').on( "click", function() {
//   console.log( "it works");
// });
$(document).ready(function(){


  $('button').click(function(){
    audio = new Audio('https://p.scdn.co/mp3-preview/905eb6019a94be6a3f637ac5c6c3521abdc56c28?cid=9fec3533ed784157ae0ede2d30fcdc02');
    audio.play();
  });

});
