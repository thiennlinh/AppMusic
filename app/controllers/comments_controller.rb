class CommentsController < ApplicationController
    def create

        if logged_in?
          @micropost = Micropost.find(params[:micropost_id])
          @comment = @micropost.comments.create(comment_params)
          redirect_to micropost_path(@micropost)
        end
      end
     
      private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
