class PlaylistsController < ApplicationController

	def show
		@playlist = Playlist.find(params[:id])
	end

	def new
        @playlist = current_user.playlists.build if logged_in?
    end

	def create
		@playlist = current_user.playlists.build(playlist_params)

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

	private

	def playlist_params
		params.require(:playlist).permit(:name)
	end
end
