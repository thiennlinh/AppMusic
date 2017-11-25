class PlaylistsController < ApplicationController

	def show
		@playlist = Playlist.find(params[:id])
		@microposts = @playlist.microposts.paginate(page: params[:page])
	end

	def new
        @playlist = current_user.playlists.build if logged_in?
    end

	def create
		@playlist = current_user.playlists.build(playlist_params)

		if @playlist.save
			flash[:success] = "Playlist created!"
            redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def addpost
		@playlist = Playlist.find(params[:playlist_id])
		@playlist.microposts << Micropost.find(params[:post_id])
	end

	def removepost
		@playlist = Playlist.find(params[:playlist_id])
		@playlist.microposts.delete(Micropost.find(params[:post_id]))

		redirect_back fallback_location: current_user
	end

	private

	def playlist_params
		params.require(:playlist).permit(:name)
	end
end
