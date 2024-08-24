class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:edit]
  before_action :sitedisable_check
  before_action :lionsocialdisable_check
  before_action :userdisable_check, only: [:edit, :update]

  def index
    @page_title = "All users Lion social"
    @users = User.all
    @users = User.by_newest
  end

  def destroy
    @user = User.friendly.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'User deleted.'
  end

  def show
    @user = User.friendly.find(params[:id])
    @posts = @user.posts
    @posts = Post.by_newest
    @page_title = "#{@user.username}'s profile Lion social"
  end

  def edit
    @user = User.friendly.find(params[:id])
    @page_title = "Edit #{@user.username}'s Lion social"
  end

  def update
    @user = User.friendly.find(params[:id])
    @user.avatar.attach(user_params[:avatar]) if user_params[:avatar].present?
    respond_to do |format|
      if @user.update(user_params)
        AllMailer.change(@user).deliver_now
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def following
    @title = "Following"
    @user = User.friendly.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end


  private

    def set_user
      @user = User.friendly.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :body, :avatar, :role)
    end
 end
