# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
counter = 1
limit = 10
$(document).on 'ready page:change', ->
 $('#add-column').click ->
    if counter == limit
      	alert 'You have reached the limit of adding ' + counter + ' inputs'
      else
	      btn = $(this)
  	    btn.before btn.data('fields').replace(/__INDEX__/g, counter++)
     return
   return

$(document).on 'ready page:change', ->
 $('#remove-column').click ->
    if counter == 0
      	alert 'You have reached the limit of adding ' + counter + ' inputs'
      else
	      btn = $(this)
  	    btn.before btn.data('fields').replace(/__INDEX__/g, counter++)
     return
   return
