require "application_system_test_case"

class AnimalTypesTest < ApplicationSystemTestCase
  setup do
    @animal_type = animal_types(:one)
  end

  test "visiting the index" do
    visit animal_types_url
    assert_selector "h1", text: "Animal types"
  end

  test "should create animal type" do
    visit animal_types_url
    click_on "New animal type"

    fill_in "Class", with: @animal_type.Class
    fill_in "Species", with: @animal_type.Species
    click_on "Create Animal type"

    assert_text "Animal type was successfully created"
    click_on "Back"
  end

  test "should update Animal type" do
    visit animal_type_url(@animal_type)
    click_on "Edit this animal type", match: :first

    fill_in "Class", with: @animal_type.Class
    fill_in "Species", with: @animal_type.Species
    click_on "Update Animal type"

    assert_text "Animal type was successfully updated"
    click_on "Back"
  end

  test "should destroy Animal type" do
    visit animal_type_url(@animal_type)
    click_on "Destroy this animal type", match: :first

    assert_text "Animal type was successfully destroyed"
  end
end
