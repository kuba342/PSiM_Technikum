require "test_helper"

class TextMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_message = text_messages(:one)
  end

  test "should get index" do
    get text_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_text_message_url
    assert_response :success
  end

  test "should create text_message" do
    assert_difference("TextMessage.count") do
      post text_messages_url, params: { text_message: { message: @text_message.message, topic: @text_message.topic } }
    end

    assert_redirected_to text_message_url(TextMessage.last)
  end

  test "should show text_message" do
    get text_message_url(@text_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_message_url(@text_message)
    assert_response :success
  end

  test "should update text_message" do
    patch text_message_url(@text_message), params: { text_message: { message: @text_message.message, topic: @text_message.topic } }
    assert_redirected_to text_message_url(@text_message)
  end

  test "should destroy text_message" do
    assert_difference("TextMessage.count", -1) do
      delete text_message_url(@text_message)
    end

    assert_redirected_to text_messages_url
  end
end
