require "test_helper"

class RoomMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @room = rooms(:one)
    sign_in @user
  end

  test "should get index" do
    get room_room_messages_url(@room)
    assert_response :success
  end

  test "should create room message" do
    assert_difference('RoomMessage.count') do
      post room_room_messages_url(@room), params: { room_message: { message: "Hello room!" } }
    end

    assert_redirected_to room_room_messages_path(@room)
  end
end
