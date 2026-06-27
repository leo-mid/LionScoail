require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit for own profile" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should redirect edit for other user profile" do
    get edit_user_url(@other_user)
    assert_redirected_to root_path
    assert_equal "Your not that user", flash[:notice]
  end

  test "should update user" do
    patch user_url(@user), params: { user: { body: "New bio" } }
    assert_redirected_to root_path
    assert_equal "User was successfully updated.", flash[:notice]
  end

  test "should get following" do
    get following_user_url(@user)
    assert_response :success
  end

  test "should get followers" do
    get followers_user_url(@user)
    assert_response :success
  end
end
