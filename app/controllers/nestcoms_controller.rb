class NestcomsController < ApplicationController
    before_action :find_commentable
    
        def new
          @comment = Nestcom.new
        end
    
        def create
          @comment = @commentable.nestcoms.new comment_params
    
          if @comment.save
            redirect_to :back, notice: 'Your comment was successfully posted!'
          else
            redirect_to :back, notice: "Your comment wasn't posted!"
          end
        end
    
        private
    
        def comment_params
          params.require(:comment).permit(:body)
        end
    
        def find_commentable
          @commentable = Nestcom.find_by_id(params[:nestcom_id]) if params[:nestcom_id]
          @commentable = Micropost.find_by_id(params[:microposts_id]) if params[:microposts_id]
        end
end
