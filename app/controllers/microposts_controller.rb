class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :upvote, :downvote, :edit, :moderate]

  def create
		if logged_in?
			@micropost = current_user.microposts.build(micropost_params)
			if @micropost.save
				redirect_to @micropost
			else
				render 'new'
			end
        end
    end

    def show
      @micropost = Micropost.find(params[:id])
      @user = User.find(@micropost.user_id)

      @micropost_copy = Micropost.find(params[:id])


	  regex = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
	  match = regex.match(@micropost.url)
	  #if match and match[2].length == 11
	  @embed_url = "http://youtube.com/embed/" + match[2]
    end

    def upvote
      @micropost = Micropost.find(params[:micropost_id])
      @micropost.upvote_by current_user
      redirect_back fallback_location: root_url
    end

    def downvote
      @micropost = Micropost.find(params[:micropost_id])
      @micropost.downvote_by current_user
      redirect_back fallback_location: root_url
    end

    def score
      self.get_upvotes.size - self.get_downvotes.size
    end

    def destroy
		  @micropost = Micropost.find(params[:id]).destroy
    	redirect_to community_moderate_path(@micropost.community_id), alert: "Post Deleted"
    end

    def new
        if Community.all.length == 0
          flash[:success] = "First create a Community."
          redirect_to new_community_path
        end
        @micropost = current_user.microposts.build if logged_in?
        @communities = Community.all
    end

    def correct_user
        @micropost = Micropost.find_by(id: params[:id])  #find the post
        unless current_user?(@post.user)
          redirect_to user_path(current_user)
        end
	end
	
    def edit
        if current_user.admin
            @micropost = Micropost.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def update
        @micropost = Micropost.find(params[:id])
        if @micropost.update_attributes(micropost_params)
          redirect_to com_mgmt_path alert: "Post Updated"
        else
          render 'edit'
        end
    end

    def moderation
      if current_user.admin
          @micropost = Micropost.find(params[:micropost_id])
      else
          redirect_to root_path
      end
    end

    def index
        @feed = Micropost.paginate(page: params[:page], :per_page => 15)
        @community_listings = Community.all.limit(1)
    end

private

	def require_permission
		if current_user != Micropost.find(params[:id]).user
			redirect_to root_path
		end
	end

	def micropost_params
        params.require(:micropost).permit(:content,:title,:url,:artist,:community_id)
    end
end
