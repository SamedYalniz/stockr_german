
$( document ).ready(function() {
    $("li.company_information_details").hover((function() {
      $(this).find('span.pencil').show();
    }), function() {
      $(this).find('span.pencil').hide();
    });
});


$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();


});
