require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test "should be valid with content" do
    post = Post.new(content: "Valid content", user: @user)
    assert post.valid?
  end

  test "should be invalid without content" do
    post = Post.new(user: @user)
    assert_not post.valid?
  end

  test "should be invalid with short content" do
    post = Post.new(content: "a", user: @user)
    assert_not post.valid?
    assert_includes post.errors[:content], "is too short (minimum is 2 characters)"
  end

  test "should belong to user" do
    assert_respond_to @post, :user
    assert_equal @user, @post.user
  end

  test "should have many comments" do
    assert_respond_to @post, :comments
  end

  test "by_newest scope should order by created_at desc" do
    assert_equal posts(:two, :one), Post.by_newest.to_a
  end
end
