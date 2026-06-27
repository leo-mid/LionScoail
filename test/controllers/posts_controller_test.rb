require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    sign_in @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get following" do
    get post_following_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { content: "New valid post content" } }
    end

    assert_redirected_to posts_path
    assert_equal 'Your post was successfully posted.', flash[:notice]
  end

  test "should not create post with invalid content" do
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { content: "a" } } # minimum length is 2
    end

    assert_response :unprocessable_entity
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { content: "Updated content" } }
    assert_redirected_to posts_path
    assert_equal 'Post was successfully updated.', flash[:notice]
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
