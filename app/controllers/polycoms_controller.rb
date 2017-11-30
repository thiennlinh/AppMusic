class PolycomsController < ApplicationController


    def create
        if logged_in?
            @comment = @commentable.polycoms.new(comment_params)
            @comment.save
            redirect_to @commentable
        end
    end

    def update
        @comment = Polycom.find(params[:polycom_id])
        # @comment = @micropost.comments.find(params[:comment_id])
        
    end

    def show
        @polycom = Polycom.find(params[:id])
        @parent = Polycom.find(params[:id])

        while @parent.commentable_type != "Micropost"
            @parent = Polycom.find(@parent.commentable_id)
        end

        if @parent.commentable_type == "Micropost"
            redirect_to micropost_path(@parent.commentable_id)
        end

    
    end

    def edit
        if current_user.admin
            @polycom = Polycom.find(params[:id])
        else
            redirect_to root_path
        end
    end

    def update
        @polycom = Polycom.find(params[:id])
        if @polycom.update_attributes(comment_params)
        
        @parent = get_micropost

        if @parent.commentable_type == "Micropost"
            redirect_to edit_micropost_path(@parent.commentable_id), alert: "Comment Updated"
        end

        else
          render 'edit'
        end
    end

    def destroy
        @parent = get_micropost
        @polycom = Polycom.find(params[:id]).destroy

        redirect_to edit_micropost_path(@parent.commentable_id), alert: "Comment Deleted"
    end

    def upvote
        @comment = Polycom.find(params[:polycom_id])
        @comment.upvote_by current_user
        @parent = get_micropost

        if @parent.commentable_type == "Micropost"
            redirect_to micropost_path(@parent.commentable_id)
        end

    end

    def downvote
        @comment = Polycom.find(params[:polycom_id])
        @comment.downvote_by current_user
        @parent = get_micropost

        if @parent.commentable_type == "Micropost"
            redirect_to micropost_path(@parent.commentable_id)
        end
    end
        
        def score
        self.get_upvotes.size - self.get_downvotes.size
        end
        
        private
        def comment_params
            params.require(:polycom).permit(:body, :user_id)
        end

    private
        
        def get_micropost
            @parent = Polycom.find(params[:polycom_id])
            while @parent.commentable_type != "Micropost"
                @parent = Polycom.find(@parent.commentable_id)
            end

            return @parent
        end
end

