require "application_system_test_case"

class ClassOfStudentsTest < ApplicationSystemTestCase
  setup do
    @class_of_student = class_of_students(:one)
  end

  test "visiting the index" do
    visit class_of_students_url
    assert_selector "h1", text: "Class of students"
  end

  test "should create class of student" do
    visit class_of_students_url
    click_on "New class of student"

    fill_in "Symbol", with: @class_of_student.symbol
    fill_in "Yearofstart", with: @class_of_student.yearOfStart
    click_on "Create Class of student"

    assert_text "Class of student was successfully created"
    click_on "Back"
  end

  test "should update Class of student" do
    visit class_of_student_url(@class_of_student)
    click_on "Edit this class of student", match: :first

    fill_in "Symbol", with: @class_of_student.symbol
    fill_in "Yearofstart", with: @class_of_student.yearOfStart
    click_on "Update Class of student"

    assert_text "Class of student was successfully updated"
    click_on "Back"
  end

  test "should destroy Class of student" do
    visit class_of_student_url(@class_of_student)
    click_on "Destroy this class of student", match: :first

    assert_text "Class of student was successfully destroyed"
  end
end
