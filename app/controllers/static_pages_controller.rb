class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page])
      @posts = current_user.microposts
    end

    @feed = Micropost.paginate(page: params[:page], :per_page => 10)

  end

  def help
  end

  def about
  end
end
