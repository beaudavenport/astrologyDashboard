# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  
  # Call rich text editor functionality on editor div
  $("#editor").wysiwyg();
  
  # On submit, set value of hidden field to html contents of rich text editor
  $(".edit_order, .new_order").submit ->
    $("#order_customer_info").val($("#editor").html()); 
    
  # Mock dropbox file AJAX response
  $("#send_docs_form").on("ajax:success", (e, data, status, xhr) ->
    $(this).append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $(this).append "<p>ERROR</p>"
  