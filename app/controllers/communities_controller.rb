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

    def new
        @community = Community.new
    end

    def index
        @community = Community.find(1)
        @feed = Micropost.all.paginate(page: params[:page], :per_page => 10)
    end

    private

        def comm_params
            params.require(:community).permit(:title)
        end
end
