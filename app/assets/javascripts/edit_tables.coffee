# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('.add_list').change ->
    btn = $(this)
    btn.siblings('.add_value').hide()
    if btn.val() == 'varchar' || btn.val() == 'char'
      btn.siblings('.add_value').show()
    else
      btn.siblings('.add_value').hide()
