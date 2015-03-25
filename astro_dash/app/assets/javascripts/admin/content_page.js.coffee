# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  
  # Call rich text editor functionality on editor div
  $("#editor").wysiwyg();
  
  # On submit, set value of hidden field to html contents of rich text editor
  $(".edit_content_page, .new_content_page").submit ->
    $("#content_page_body").val($("#editor").html());
    