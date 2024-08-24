module PostsHelper

  def is_post_user
    @post = Post.find(params[:id])
    if current_user == @post.user
    else
      redirect_to posts_path, notice: "You are not the post user."
    end
  end
end
