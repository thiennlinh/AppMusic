class PlaylistsController < ApplicationController

	def show
		@playlist = Playlist.find(params[:id])
		@microposts = @playlist.microposts.paginate(page: params[:page])

		if logged_in?
            @not_saved = true
            if current_user.spot_hash != nil
                @not_saved = false

                @expiration_time = JSON.parse(current_user.spot_hash)
                @expiration_time = @expiration_time["credentials"]["expires_at"]
                @current_time = DateTime.now.strftime('%s')

                @expired = true

                if(@expiration_time > @current_time.to_i)
                    @expired = false
                end
            end
        end
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
			render 'new'
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

	def spotify_helper
        @playlist = Playlist.find(params[:playlist_id])
    end

	def create_playlist
        @playlist = Playlist.find(params[:community_id])

        RSpotify.authenticate("7eaf81c8e2384e0f9b021058e3141882", "580dd6fcb0e747b8b6e4d38f9e0f782b")
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])


        redirect_to playlist_spotify_path(@playlist)

    end

	private

	def playlist_params
		params.require(:playlist).permit(:name)
	end
end
