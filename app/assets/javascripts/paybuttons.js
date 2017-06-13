
$(document).ready(function(){
  $('.button-bar').click(function(){
    $(this).addClass('chosen');
    $("#order_table_number").val('');
    $(".button-delivery").removeClass('chosen');
  });

  $('#order_table_number').on('keyup change', function(){
    $(".button-delivery").addClass('chosen');
  });

  $('#order_table_number').on('keyup change', function(){
    if ($('#order_table_number').val()) {
      $('.button-bar').removeClass('chosen');
    };
  });
});
