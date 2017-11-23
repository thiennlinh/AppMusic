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
        redirect_to @community
      end
  
      def downvote
        @community = Community.find(params[:community_id])
        @community.downvote_by current_user
        redirect_to @community
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

    private

        def comm_params
            params.require(:community).permit(:title, :description, :user_id)
        end
end
