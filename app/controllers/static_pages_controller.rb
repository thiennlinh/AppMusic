class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?

    # @microposts = @user.microposts.paginate(page: params[:page])
  end

  def help
  end

  def about
  end
end
