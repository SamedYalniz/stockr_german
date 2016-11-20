


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
