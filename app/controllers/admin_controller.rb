class AdminController < ApplicationController
    before_action :correct_user

    def index
    end

    def community_mgmt
        @communities = Community.all
    end

    ## Only allow admins access to the panel,
    ## otherwise redirect users back to the homepage
    def correct_user
    	@user = current_user
    	redirect_to root_path unless current_user.admin? do
          redirect_to user_path(current_user)
        end
    end
end
