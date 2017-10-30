class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page])
      @posts = current_user.microposts.build
    end

    @feed = Micropost.paginate(page: params[:page])

  end

  def help
  end

  def about
  end
end
