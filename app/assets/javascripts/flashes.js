// when you click on the alert it fades out
$(".alert-dismissible").click(function (e) {
  $(".alert-dismissible").slideUp();
});

// when you swipe the alert it swipes left or right
// $(document).ready(function(){
//   $(".alert-dismissible").swiperight(function() {
//     $(".alert-dismissible").slideRight();
//   });
//   $(".alert-dismissible").swipeleft(function() {
//     $(".alert-dismissible").slideLeft();
//   });
// });
