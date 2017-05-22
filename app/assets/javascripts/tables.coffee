# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
counter = 1
limit = 10
test = 1

$(document).ready ->

  $('#important').click ->
    $('#important').val().replace(/ /g,'')

  $('.restricted').keypress ->
    if $('.restricted').val().trim().length != 0
      $('#important').attr 'disabled', false
    else
      $('#important').attr 'disabled', true

  removeField = (button) ->
    btn = $(button)
    btn.parents('.js-row').remove()
    btn.before btn.data('index').replace(/__INDEX__/g, counter--)

  changeField = (button) ->
    btn = $(button)
    if btn.is(':checked')
      $('#add-column').click ->
        $('.test').prop 'disabled', true
      btn.prop 'class', 'primary_key'
      $('.test').prop 'disabled', true
      btn.siblings('.remove').prop 'disabled', true
      btn.siblings('.unique').prop 'disabled', true
      btn.siblings('.required').prop 'disabled', true
    else
      $('#add-column').click ->
        $('.test').prop 'disabled', false
      btn.prop 'class', 'test'
      $('.test').prop 'disabled', false
      btn.siblings('.remove').prop 'disabled', false
      btn.siblings('.unique').prop 'disabled', false
      btn.siblings('.required').prop 'disabled', false

  changeType = (button) ->
    btn = $(button)
    if btn.val() == 'varchar' || btn.val() == 'char'
      btn.siblings('#value').show()
    else
      btn.siblings('#value').hide()

  checkContent = (button) ->
    $('#important').attr 'disabled', true
    btn = $(button)
    if btn.val().trim().length != 0
      $('#important').attr 'disabled', false
    else
      $('#important').attr 'disabled', true

  $('.add-column').click ->
    $('#important').attr 'disabled', true
    if counter == limit
      alert 'You have reached the limit of adding ' + counter + ' inputs'
    else
      btn = $(this)
      btn.before btn.data('fields').replace(/__INDEX__/g, counter++)
    $('.remove').click ->
      removeField this
    $('.test').change ->
      changeField this
    $('.list').change ->
      changeType this
    $('.restricted').keyup ->
      checkContent this
