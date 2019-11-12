$(document).ready(function(){
  $("#user_form").validationEngine('attach', {
    promptPosition: "bottomLeft",
  });
  $("#phone_form").validationEngine('attach', {
    promptPosition: "bottomLeft",
  });
  $("#address_form").validationEngine('attach', {
    promptPosition: "bottomLeft",
  });
});