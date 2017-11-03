class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :upvote, :downvote]
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
          flash[:success] = "Micropost created!"
          redirect_to root_url
        else
          render 'static_pages/home'
        end
    end

    def show
      @micropost = Micropost.find(params[:id])
      @user = User.find(@micropost.user_id)

    end

    def upvote
      @test = "test"
      @micropost = Micropost.find(params[:id])
      @micropost.upvote_by current_user
      redirect_to root_path
    end

    def downvote
      @micropost = Micropost.find(params[:id])
      @micropost.downvote_by current_user
      redirect_to root_path
    end
    
    def score
      self.get_upvotes.size - self.get_downvotes.size
    end
    
      def destroy
      end

      def new
        @micropost = current_user.microposts.build if logged_in?
      end

      private
      
          def micropost_params
            params.require(:micropost).permit(:content,:title,:url,:genre)
          end
end
