require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @comment = comments(:one)
    sign_in @user
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url(@post), params: { comment: { body: "This is a comment" } }
    end

    assert_redirected_to post_path(@post)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_comment_url(@post, @comment)
    end

    assert_redirected_to post_path(@post)
  end
end
