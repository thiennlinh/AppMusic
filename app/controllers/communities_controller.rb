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

    private

        def comm_params
            params.require(:community).permit(:title)
        end
end
