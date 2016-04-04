
var items;
var imgCounter = 0;
var item_offered_id ;
var item_liked_id;
var item_liked_url;
var item_liked_desc ;
var item_liked_title ;
var item_disliked_id;
var item_disliked_url;
var item_disliked_desc ;
var item_disliked_title ;
var distance ;
var like_func = function(offered, liked){
  $.post('/likes', {item_offered_id: offered, item_liked_id: liked }, function(data, textStatus, jqXHR)
  {
    //saved func
    var match = data;
    console.log("liked!");
    if (match){
      $('#match-offered-item').attr('src', $('#itemImage2').attr('src'));
      //$('#match-liked-item').attr('src', item_liked_url);
      $('#match-liked-item').attr('src', $('#itemImage').attr('src'));
      $('#match-liked-desc').text(item_liked_desc);
      $('#match-liked-title').text(item_liked_title);
      $( "#match-modal" ).addClass("is-active");
    }
    filter();
  },"json").fail(function(jqXHR, textStatus, errorThrown)
  {
    //fail func
  });
};

var dislike_func = function(offered, disliked){
  $.post('/dislikes', {item_offered_id: offered, item_disliked_id: disliked }, function(data, textStatus, jqXHR)
  {
    console.log("disliked!");
    console.log(data);
    filter();
  },"json").fail(function(jqXHR, textStatus, errorThrown)
  {
    //fail func
  });
};
// Notifies the user that there are no more items to trade with.
var filter = function(){
  distance = rangePrimary.value;
  $.getJSON('/items', {filter: 2, current_item_id: item_offered_id, distance: distance}, function(data) {
    if (!data){
      console.log("no data found")
       return false;
    }
    if (data.length == 0){
      $("#itemTitle").text("No more items around you...");
      $("#itemDescription").text("Hint: Add a new item to keep trading or change your distance.");
      $('#itemImage').attr('src', 'images/swixch.jpg');
    }
    else {
      console.log("IMGCOUNTER VALUE: >>>>>>>>")
      console.log(imgCounter)
    items = data;
    $('#itemImage').attr('src', items[0].picture_url.url);
    $("#itemTitle").text(items[0].name);
    $("#itemDescription").text(items[0].description);

    item_liked_title = items[0].name;
    item_liked_desc =items[0].description;
    item_liked_id = items[0].id ;
    imgCounter +=1;

  }
  });
};



$(document).ready(function() {
  item_offered_id = $(".menu-block").data('item-id');
  console.log(item_offered_id);
  var small_pic = $(".menu-block").data('images/swixch2.jpg');
  $('#itemImage2').attr('src', 'images/swixch2.jpg');
  var small_item_title = $(".menu-block").data('item-name');
  var small_item_desc = $(".menu-block").data('item-desc');


  $("#itemTitle").text("Ooops...");
  $("#itemDescription").text("Looks like you dont have any items selected. Add an item or select an existing item to play.");
  $('#itemImage').attr('src', 'images/swixch.jpg');
  $('#match-offered-title').text(small_item_title);
  $('#match-offered-desc').text(small_item_desc);


  // $('#slider').on('change', function(){
  //   var distance = rangePrimary.value;
  //
  //   $.getJSON('/items', {filter: 2, distance: distance}, function(data) {
  //     if (!data){
  //       return false;
  //     }
  //     items = data;
  //     debugger
  //     $('#itemImage').attr('src', items[0].picture_url.url);
  //     $("#itemTitle").text(items[0].name);
  //     $("#itemDescription").text(items[0].description);
  //     // item_liked_id = items[0].id ;
  //     imgCounter = 1;
  //
  //   });
  //
  // });




  // $.getJSON('/items', {filter: 1}, function(data) {
  //   if (!data){
  //     return false;
  //   }
  //   items = data;
  //   $('#itemImage').attr('src', items[0].picture_url.url);
  //   $("#itemTitle").text(items[0].name);
  //   $("#itemDescription").text(items[0].description);
  //
  //   item_liked_title = items[0].name;
  //   item_liked_desc =items[0].description;
  //   item_liked_id = items[0].id ;
  //   imgCounter +=1;
  // });
  $('#slider').on('change', function(){

       distance = rangePrimary.value;
      if(item_offered_id){
      $.getJSON('/items', {filter: 2, current_item_id: item_offered_id, distance: distance}, function(data) {
        if (!data){
          return false;
        }
        console.log("hi");
        console.log(data)
        items = data;
        debugger
        $('#itemImage').attr('src', items[0].picture_url.url);
        $("#itemTitle").text(items[0].name);
        $("#itemDescription").text(items[0].description);
        // item_liked_id = items[0].id ;
        imgCounter = 0;

      });
    }

    });

  $(".menu-block").on("click", function(){
    item_offered_id = $(this).data('item-id');
    //change_current_item(item_offered_id);
    filter();
    var small_pic = $(this).data('thumb-picture');
    var small_item_title = $(this).data('item-name');
    var small_item_desc = $(this).data('item-desc');
    // item_offered_id = $(this).data('item-id');
    // change_current_item(item_offered_id);
    $('#itemImage2').attr('src', small_pic);
    $('#match-offered-title').text(small_item_title);
    $('#match-offered-desc').text(small_item_desc);
  });
  $("#button-add-item").on("click", function(){
    $( "#item-modal" ).addClass("is-active");
    //  $( "#match-modal" ).addClass("is-active");
  });
  $("#item-modal-close").on("click", function(){
    $("#item-modal").removeClass("is-active");
  });
  $("#match-modal-close").on("click", function(){
    $("#match-modal").removeClass("is-active");
  });



  if ($('#touchsurface2').length){
    function swipedetect(el, callback){

      var touchsurface = el,
      swipedir,
      startX,
      startY,
      distX,
      distY,
      threshold = 75, //required min distance traveled to be considered swipe
      restraint = 100, // maximum distance allowed at the same time in perpendicular direction
      allowedTime = 500, // maximum time allowed to travel that distance
      elapsedTime,
      startTime,
      handleswipe = callback || function(swipedir){};

      touchsurface.addEventListener('touchstart', function(e){
        var touchobj = e.changedTouches[0];
        swipedir = 'none';
        dist = 0;
        startX = touchobj.pageX;
        startY = touchobj.pageY;
        startTime = new Date().getTime(); // record time when finger first makes contact with surface
        e.preventDefault();
      }, false);

      touchsurface.addEventListener('touchmove', function(e){
        e.preventDefault(); // prevent scrolling when inside DIV
      }, false);

      touchsurface.addEventListener('touchend', function(e){

        var touchobj = e.changedTouches[0];
        distX = touchobj.pageX - startX; // get horizontal dist traveled by finger while in contact with surface
        distY = touchobj.pageY - startY; // get vertical dist traveled by finger while in contact with surface
        elapsedTime = new Date().getTime() - startTime; // get time elapsed
        if (elapsedTime <= allowedTime){ // first condition for awipe met
          if (Math.abs(distX) >= threshold && Math.abs(distY) <= restraint){ // 2nd condition for horizontal swipe met

            swipedir = (distX < 0)? 'left' : 'right'; // if dist traveled is negative, it indicates left swipe
          }
          else if (Math.abs(distY) >= threshold && Math.abs(distX) <= restraint){ // 2nd condition for vertical swipe met
            swipedir = (distY < 0)? 'up' : 'down'; // if dist traveled is negative, it indicates up swipe
          }
        }
        handleswipe(swipedir);
        e.preventDefault();
      }, false);
    }

    window.addEventListener('load', function(){
      var el = document.getElementById('itemImage');
      var hidetimer = null;
      swipedetect(el, function(swipedir){
        swipe(swipedir);
      });
    }, false);

  }

  $('#like').on('click', function(){
    distance = rangePrimary.value;
    $.getJSON('/items', {filter: 2, current_item_id: item_offered_id, distance: distance}, function(data) {
    if (data.length > 0)
    {
      like_func(item_offered_id,item_liked_id);
      swipe('right');
    }
  });
    //filter();
  });
  $('#nope').on('click', function(){
    distance = rangePrimary.value;
    $.getJSON('/items', {filter: 2, current_item_id: item_offered_id, distance: distance}, function(data) {
      if (data.length > 0){
          dislike_func(item_offered_id,item_liked_id);
          swipe('left');
      }
    });
    //filter();

  });
});

function swipe(swipedir){
  if (swipedir != 'none'){

    if (swipedir =='left'){

      $('.cardstatus').addClass('dislike');
      $("#inner").animate({
        left: '-1000px',
        opacity: '0.25',
      },{
        duration: 750,
        complete: function() {
          $("#inner").animate({
            opacity: '1.0',
            left: '0px',
          },750);
        }
      });
    }
    if (swipedir =='right'){
      $('.cardstatus').addClass('like');
      $("#inner").animate({
        left: '1000px',
        opacity: '0.25',
      },{
        complete: function() {
          $("#inner").animate({
            opacity: '1.0',
            left: '0px',
          },750);
        },
        duration: 750
      });
    }
    setTimeout(function(){
      if (!items){
        return false;
      }
      if (imgCounter > items.length - 1){
        imgCounter= 0
      }

      // $('#itemImage').attr('src', items[imgCounter].picture_url.url);
      // $("#itemTitle").text(items[imgCounter].name);
      // $("#itemDescription").text(items[imgCounter].description);
      //
      // item_liked_id = items[imgCounter].id ;
      // item_liked_url = items[imgCounter].picture_url.url ;
      // item_liked_desc = items[imgCounter].description ;
      // item_liked_title = items[imgCounter].name;
      $('.cardstatus').removeClass('like').removeClass('dislike');
      imgCounter += 1;
    }, 750);
  }
}
