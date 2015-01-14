# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  
  # Call rich text editor functionality on editor div
  $("#editor").wysiwyg();
  
  # On submit, set value of hidden field to html contents of rich text editor
  $("#new_order").submit ->
    $("#order_customer_info").val($("#editor").html());
    