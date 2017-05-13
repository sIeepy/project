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
  $('#list').click ->
    $('#list').change ->
      myValue = $(this).val()
      switch myValue
        when 'text'
          $('#value').prop 'placeholder', 'Text'
        when 'boolean'
          $('#value').prop 'placeholder', 'Boolean'
        when 'integer'
          $('#value').prop 'placeholder', 'Integer'
        when 'varchar'
          $('#value').prop 'placeholder', 'Change variable length'
        when 'char'
          $('#value').prop 'placeholder', 'Change variable length'
        when 'money'
          $('#value').prop 'placeholder', 'Money'
        when 'real'
          $('#value').prop 'placeholder', 'Real'
        when 'time'
          $('#value').prop 'placeholder', 'Time - HH:MM:SS'
        when 'date'
          $('#value').prop 'placeholder', 'Date - YYYY-MM-DD'
        when 'timestamp'
          $('#value').prop 'placeholder', 'Timestamp - YYYY-MM-DD HH:MM:SS'
      return
    return
