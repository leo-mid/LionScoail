require "test_helper"

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = users(:one)
    @user2 = users(:two)
    @conversation = conversations(:one)
    sign_in @user1
  end

  test "should get index" do
    get conversations_url
    assert_response :success
  end

  test "should create conversation" do
    assert_difference('Conversation.count') do
      post conversations_url, params: { sender_id: @user1.id, receiver_id: users(:admin).id }
    end

    assert_redirected_to conversation_messages_path(Conversation.last)
  end

  test "should redirect to existing conversation" do
    assert_no_difference('Conversation.count') do
      post conversations_url, params: { sender_id: @user1.id, receiver_id: @user2.id }
    end

    # The order of sender/receiver might be swapped in the found conversation
    # but the route should lead to the correct conversation ID.
    @conversation = Conversation.between(@user1.id, @user2.id).first
    assert_redirected_to conversation_messages_path(@conversation)
  end
end
