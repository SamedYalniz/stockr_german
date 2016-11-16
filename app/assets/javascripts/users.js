
$( document ).ready(function() {
  $('div.company_information').hover((function() {
    $(this).find('span.pencil').show();
  }), function() {
    $(this).find('span.pencil').hide();
  });
});
