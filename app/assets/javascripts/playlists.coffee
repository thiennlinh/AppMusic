# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".playlists.show").ready ->
	class PlaylistQueue
		constructor: (queue) ->
			@queue = queue
			@position = 0

		getNext: ->
			if @position >= @queue.length - 1
				return null
			else
				@position++
				return @queue[@position]

		getPrev: ->
			if @position <= 0
				return null
			else
				@position--
				return @queue[@position]

	parse_youtube_id = (url) ->
		regex = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
		match = url.match(regex)
		if match and match[2].length == 11
			return match[2]
		else
			return null

	window.player = undefined

	window.onYouTubeIframeAPIReady = ->
		@microposts = $('#video-placeholder').data('microposts')
		vidId = parse_youtube_id @microposts[0]['url']
		window.player = new (YT.Player)('video-placeholder',
	    	width: 600
	    	height: 400
	    	videoId: vidId
	    	playerVars: color: 'white')
