require "application_system_test_case"

class PresencesTest < ApplicationSystemTestCase
  setup do
    @presence = presences(:one)
  end

  test "visiting the index" do
    visit presences_url
    assert_selector "h1", text: "Presences"
  end

  test "should create presence" do
    visit presences_url
    click_on "New presence"

    check "Ispresent" if @presence.isPresent
    click_on "Create Presence"

    assert_text "Presence was successfully created"
    click_on "Back"
  end

  test "should update Presence" do
    visit presence_url(@presence)
    click_on "Edit this presence", match: :first

    check "Ispresent" if @presence.isPresent
    click_on "Update Presence"

    assert_text "Presence was successfully updated"
    click_on "Back"
  end

  test "should destroy Presence" do
    visit presence_url(@presence)
    click_on "Destroy this presence", match: :first

    assert_text "Presence was successfully destroyed"
  end
end
