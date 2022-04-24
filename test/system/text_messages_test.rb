require "application_system_test_case"

class TextMessagesTest < ApplicationSystemTestCase
  setup do
    @text_message = text_messages(:one)
  end

  test "visiting the index" do
    visit text_messages_url
    assert_selector "h1", text: "Text messages"
  end

  test "should create text message" do
    visit text_messages_url
    click_on "New text message"

    fill_in "Message", with: @text_message.message
    fill_in "Topic", with: @text_message.topic
    click_on "Create Text message"

    assert_text "Text message was successfully created"
    click_on "Back"
  end

  test "should update Text message" do
    visit text_message_url(@text_message)
    click_on "Edit this text message", match: :first

    fill_in "Message", with: @text_message.message
    fill_in "Topic", with: @text_message.topic
    click_on "Update Text message"

    assert_text "Text message was successfully updated"
    click_on "Back"
  end

  test "should destroy Text message" do
    visit text_message_url(@text_message)
    click_on "Destroy this text message", match: :first

    assert_text "Text message was successfully destroyed"
  end
end
