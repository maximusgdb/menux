
$(document).ready(function(){
  $('.button-bar').click(function(){
    $(this).addClass('chosen');
    $("#order_table_number").val('');
  });
  $('#order_table_number').on('keyup change', function(){
    if ($('#order_table_number').val()) {
      $('.button-bar').removeClass('chosen');
    };
  });
});
