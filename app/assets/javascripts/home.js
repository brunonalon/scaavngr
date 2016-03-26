
// function statusChangeCallback(response) {
// console.log('statusChangeCallback');
// console.log(response);
// if (response.status === 'connected') {
//   // Logged into your app and Facebook.
//   testAPI();
// } else if (response.status === 'not_authorized') {
//   // The person is logged into Facebook, but not your app.
//   document.getElementById('status').innerHTML = 'Please log ' +
//     'into this app.';
// } else {
//   // The person is not logged into Facebook, so we're not sure if
//   // they are logged into this app or not.
//   document.getElementById('status').innerHTML = 'Please log ' +
//     'into Facebook.';
// }
// }
// function checkLoginState() {
// FB.getLoginStatus(function(response) {
//   statusChangeCallback(response);
// });
// }
//
//   window.fbAsyncInit = function() {
//     FB.init({
//       appId      : '678960605577796',
//       xfbml      : true,
//       version    : 'v2.5'
//     });
//     FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//       });
//   };
//
//   (function(d, s, id){
//      var js, fjs = d.getElementsByTagName(s)[0];
//      if (d.getElementById(id)) {return;}
//      js = d.createElement(s); js.id = id;
//      js.src = "//connect.facebook.net/en_US/sdk.js";
//      fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));
//
// function testAPI() {
//  console.log('Welcome!  Fetching your information.... ');
//  FB.api('/me', function(response) {
//    console.log('Successful login for: ' + response.name);
//    document.getElementById('status').innerHTML =
//      'Thanks for logging in, ' + response.name + '!';
//  });
//  FB.api(
//   "/139273346459366/photos/uploaded",
//   function (response) {
//     if (response && !response.error) {
//       console.log(response);
//       /* handle the result */
//     }
//   }
// );
// }
//
// function initMap() {
// var map = new google.maps.Map(document.getElementById('map'), {
//   center: {lat: -34.397, lng: 150.644},
//   zoom: 6
// });
// var infoWindow = new google.maps.InfoWindow({map: map});
//
// // Try HTML5 geolocation.
// if (navigator.geolocation) {
//   navigator.geolocation.getCurrentPosition(function(position) {
//     var pos = {
//       lat: position.coords.latitude,
//       lng: position.coords.longitude
//     };
//     console.log(pos);
//
//     infoWindow.setPosition(pos);
//     infoWindow.setContent('Location found.');
//     map.setCenter(pos);
//   }, function() {
//     handleLocationError(true, infoWindow, map.getCenter());
//   });
// } else {
//   // Browser doesn't support Geolocation
//   handleLocationError(false, infoWindow, map.getCenter());
// }
// }
//
// function handleLocationError(browserHasGeolocation, infoWindow, pos) {
// infoWindow.setPosition(pos);
// infoWindow.setContent(browserHasGeolocation ?
//                       'Error: The Geolocation service failed.' :
//                       'Error: Your browser doesn\'t support geolocation.');
// }
