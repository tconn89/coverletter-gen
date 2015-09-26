# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.add').autocomplete
  	source: $('.add').data('autocomplete-source')
  	autoFocus:true
  	select: (event, ui) ->
      prior = $('.saved-value').text()
      append(prior,ui)
      $('.saved-value').text(prior + ui.item.value + ',')
      return false

append = (truth, ui) ->
  if truth
    console.log(truth)
    $('.add').val(truth + ' ' + ui.item.value + ', ')
  else
    $('.add').val(ui.item.value + ', ')