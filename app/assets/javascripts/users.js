
$( document ).ready(function() {
    $("li.company_information_details").hover((function() {
      $(this).find('span.pencil').show();
      if($(this).find(":input").is(":focus")){
        $(this).removeClass("Hover");
      }
      else {
        $(this).addClass("Hover");
        $(this).find('span.pencil').show();
      }
      $("li.company_information_details").focusin(function() {
        $(this).removeClass("Hover");
      });
    }), function() {
      $(this).find('span.pencil').hide();
      $(this).removeClass("Hover");

    });
});


$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();


});


$(document).ready(function() {

});
