class AdminController < ApplicationController
    before_action :correct_user

    def index
    end

    def community_mgmt
        @communities = Community.all
    end

    def admin_mgmt
        @users = User.all.where(admin: 'f')
        @admins = User.all.where(admin: 't')
    end

    def usr_mgmt
        @users = User.all
    end

    def spotify_mgmt
    end

    ## Only allow admins access to the panel,
    ## otherwise redirect users back to the homepage
    def correct_user
        if logged_in?
            @user = current_user
            redirect_to root_path unless current_user.admin? do
            redirect_to user_path(current_user)
            end
        else
            redirect_back fallback_location: root_path
        end
    end
end
