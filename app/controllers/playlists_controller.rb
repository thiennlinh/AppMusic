class PlaylistsController < ApplicationController

	def show
		@playlist = Playlist.find(params[:id])
	end

	def create
		@playlist = Playlist.new({:name => params[:playlist][:name]})

		if @playlist.save
			flash[:success] = "Micropost created!"
            redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def addpost
		@playlist = Playlist.find(params[:playlist_id])
		@playlist.microposts << Micropost.find(params[:post_id])
	end
end
