class CommunitiesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

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
        @community = Community.find(1)
        @feed = Micropost.all.paginate(page: params[:page], :per_page => 10)

            #  Make sure to only collect 3 records using whatever method!
        @community_listings = []
            @community_names = []
            for id in 1..Community.count
            @community_names.append(Community.where(id: id).select(:title, :id))
            @community_listings.push(Micropost.where(community_id: id).limit(8))
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

    private

        def comm_params
            params.require(:community).permit(:title, :description, :user_id)
        end
end
