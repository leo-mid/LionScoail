require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = users(:one)
    @user2 = users(:two)
    @conversation = conversations(:one)
    sign_in @user1
  end

  test "should get index" do
    get conversation_messages_url(@conversation)
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post conversation_messages_url(@conversation), params: { message: { body: "New message content" } }
    end

    assert_redirected_to conversation_messages_url(@conversation)
  end

  test "should deny access to unauthorized user" do
    sign_in users(:admin)
    get conversation_messages_url(@conversation)
    assert_redirected_to root_path
    assert_equal "You do not have access to this", flash[:notice]
  end
end
