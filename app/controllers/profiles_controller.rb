class ProfilesController < ApplicationController
  before_action :authenticate_user!, :only => [:follow, :unfollow]
  before_action :set_user, :only => [:user_page]

  def user_page
    @posts = Post.timeline(@user).page params[:page]
    @post = Post.new
  end

  def current_user_page
    redirect_to user_page_path(:username => current_user.username)
  end

  def follow
    @user = User.find(params[:id])
    if current_user == @user
      respond_to do |format|
        format.html {
          flash[:error] = "You can't follow yourself."
          redirect_to :back }
        format.js {}
      end
    else
      current_user.follow(@user)
      respond_to do |format|
        format.html {
          flash[:notice] = "You are now following #{@user.username}." }
        format.js {}
      end
    end
  end

    # if current_user
    #   if current_user == @user
    #     flash[:error] = "You can't follow yourself."
    #     redirect_to :back
    #   else
    #     current_user.follow(@user)
    #     flash[:notice] = "You are now following #{@user.username}."
    #     redirect_to :back
    #   end
    # else
    #   flash[:error] = "You must sign in to follow #{@user.username}."
    #   redirect_to :back
    # end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    respond_to do |format|
      format.html {
        flash[:notice] = "You are no longer following #{@user.username}."
        redirect_to :back }
      format.js {}
    end
    # if current_user
    #   current_user.stop_following(@user)
    #   flash[:notice] = "You are no longer following #{@user.username}."
    #   redirect_to :back
    # else
    #   flash[:error] = "You must sign in to unfollow #{@user.username}."
    # end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_user
    @user = User.find_by("username = ?", params[:username])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:user_id)
  end

end
