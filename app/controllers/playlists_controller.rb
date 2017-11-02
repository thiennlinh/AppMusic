class PlaylistsController < ApplicationController

	def show
		@playlist = Playlist.find(params[:id])
	end

	def create
		@playlist = Playlist.new({:name => params[:playlist][:name]})

		if params[:playlist][:micropost1]
			@playlist.microposts << Micropost.find(params[:playlist][:micropost1])
		end
		if params[:playlist][:micropost2]
			@playlist.microposts << Micropost.find(params[:playlist][:micropost2])
		end

		if @playlist.save
			render plain: 'Success!'
		else
			render plain: 'Failure!'
		end
	end
end
