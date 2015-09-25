# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.add').autocomplete
  	source: $('.add').data('autocomplete-source')
  	autoFocus:true
  	select: (event, ui) ->
  		prior = $('.saved-value').text()
  		if prior
	  		$('.add').val(prior + ' ' + ui.item.value)
	  		false
  		else
  			$('.add').val(ui.item.value + ', ')
  			$('.saved-value').text(ui.item.value + ',')
   		false