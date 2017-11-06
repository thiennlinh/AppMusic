# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# DISCLAIMER: The youtube embeded API is a steaming pile of dog feces, I'm doing
#             my best here to make it work


#parse_youtube_id = (url) ->
#	regex = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
###	match = url.match(regex)
	if match and match[2].length == 11
		return match[2]
	else
		return null

# used to load the player, can be called from turbolinks:load or
# onYouTubeIframeAPIReady
render_player = ->
	vidId = parse_youtube_id $('#video-placeholder').data('url')
	window.player = new (YT.Player)('video-placeholder',
    	width: 600
    	height: 400
    	videoId: vidId
    	playerVars: color: 'white')

window.player = undefined

window.onYouTubeIframeAPIReady = ->
	render_player()

$(document).on 'turbolinks:load', ->
	if YT?
		render_player()
###
