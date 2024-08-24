class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.update_attribute(:site, "social")

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end
  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
