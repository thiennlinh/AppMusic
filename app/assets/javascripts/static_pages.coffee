# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".static_pages.home").ready ->
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

		getById: (id) ->
			index = @queue.findIndex((element) -> element.id == id)
			if index >= 0
				@position = index
				return @queue[@position]
			else
				return null

	parse_youtube_id = (url) ->
		regex = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
		match = url.match(regex)
		if match and match[2].length == 11
			return match[2]
		else
			return null

	playQueue = new PlaylistQueue($('#video-placeholder').data('microposts'))

	window.player = undefined

	window.onYouTubeIframeAPIReady = ->
		microposts = $('#video-placeholder').data('microposts')
		vidId = parse_youtube_id microposts[0]['url']
		vidWidth = $('#video-container').width()
		window.player = new (YT.Player)('video-placeholder',
			width: vidWidth
			height: vidWidth * (2.0/3.0)
			videoId: vidId
			playerVars: color: 'white'
			events: onStateChange: onStateChange)

	# event.data == 0 when video has ended
	#            == 1 when video is played
	#            == 2 when video is paused
	window.onStateChange = (event) ->

		if event.data == 0
			next = playQueue.getNext()
			if next
				window.player.loadVideoById(parse_youtube_id next.url)
			else
				window.isPlaying = false
				$('#play-pause-button').html('<i class="small material-icons">play_arrow</i>')

		if event.data == 1
			$('#play-pause-button').html('<i class="small material-icons">pause</i>')
		if event.data == 2
			$('#play-pause-button').html('<i class="small material-icons">play_arrow</i>')

	$('#play-pause-button').click ->
		if window.player.getPlayerState() == 1
			window.player.pauseVideo()
		else
			window.player.playVideo()

	$('#previous-button').click ->
		prev = playQueue.getPrev()
		if prev
			window.player.loadVideoById(parse_youtube_id prev.url)
		else
			alert 'No Previous Song'

	$('#next-button').click ->
		next = playQueue.getNext()
		if next
			window.player.loadVideoById(parse_youtube_id next.url)
		else
			alert 'No Next Song'

	$(window).resize ->
		vidWidth = $('#video-container').width()
		window.player.setSize(vidWidth, vidWidth * (2.0/3.0))
