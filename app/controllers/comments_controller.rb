class CommentsController < ApplicationController
    def create

        if logged_in?
          @micropost = Micropost.find(params[:micropost_id])
          @comment = @micropost.comments.create(comment_params)
          redirect_to micropost_path(@micropost)
        end
    end

    def update
        @micropost = Micropost.find(params[:micropost_id])
        @comment = @micropost.comments.find(params[:comment_id])
        
    end

    def upvote
        @comment = Comment.find(params[:comment_id])
        @comment.upvote_by current_user
        redirect_to @comment.micropost
      end
  
      def downvote
        @comment = Comment.find(params[:comment_id])
        @comment.downvote_by current_user
        redirect_to @comment.micropost
      end
      
      def score
        self.get_upvotes.size - self.get_downvotes.size
      end
     
      private
        def comment_params
            params.require(:comment).permit(:body, :user_id, :score)
        end
end
