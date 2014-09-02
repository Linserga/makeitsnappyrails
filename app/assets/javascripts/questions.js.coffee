# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Makeitsnappy = {}

Makeitsnappy.autoSelectSearch = ->
	window.onload = ->
		keyword = document.getElementById 'keyword';
		keyword.onclick = ->
			@select()
		
	


Makeitsnappy.autoSelectSearch()