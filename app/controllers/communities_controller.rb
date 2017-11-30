class CommunitiesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :edit, :moderation]

    def create
        @community = Community.new(comm_params)

        if @community.save
            redirect_to @community
        else
            render 'new'    
        end
    end

    def show
        @community = Community.find(params[:id])
        @feed = Micropost.where(community_id: @community.id).paginate(page: params[:page], :per_page => 15)

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
        @community = Community.new
    end

    def index
        @community_listings = Community.all
    end

    def destroy
        if current_user.admin
            @community = Community.find(params[:id]).destroy
            redirect_to com_mgmt_path alert: "Community Deleted"
        else
            redirect_to root_path
        end
    end

    def edit
        if current_user.admin
            @community = Community.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def update
        @community = Community.find(params[:id])
        if @community.update_attributes(comm_params)
          redirect_to com_mgmt_path alert: "Community Updated"
        else
          render 'edit'
        end
    end

    def upvote
        @community = Community.find(params[:community_id])
        @community.upvote_by current_user
        redirect_back fallback_location: root_url, alert: "Added " + @community.title + " your list."
      end
  
      def downvote
        @community = Community.find(params[:community_id])
        @community.downvote_by current_user
        redirect_back fallback_location: root_url
      end
      
      def score
        self.get_upvotes.size - self.get_downvotes.size
      end

      def moderation
        if current_user.admin
            @community = Community.find(params[:community_id])
        else
            redirect_to root_path
        end
      end
    
    def spotify_helper
        @community = Community.find(params[:community_id])
    end

    def create_playlist
        @community = Community.find(params[:community_id])
        
        RSpotify.authenticate("7eaf81c8e2384e0f9b021058e3141882", "580dd6fcb0e747b8b6e4d38f9e0f782b")
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])


        redirect_to community_spotify_path(@community)

    end

    private

        def comm_params
            params.require(:community).permit(:title, :description, :user_id)
        end
end
