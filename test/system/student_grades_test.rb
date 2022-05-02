require "application_system_test_case"

class StudentGradesTest < ApplicationSystemTestCase
  setup do
    @student_grade = student_grades(:one)
  end

  test "visiting the index" do
    visit student_grades_url
    assert_selector "h1", text: "Student grades"
  end

  test "should create student grade" do
    visit student_grades_url
    click_on "New student grade"

    fill_in "Course", with: @student_grade.course_id
    fill_in "Date", with: @student_grade.date
    fill_in "Grade", with: @student_grade.grade
    fill_in "Student", with: @student_grade.student_id
    fill_in "Teacher", with: @student_grade.teacher_id
    fill_in "Test", with: @student_grade.test_id
    click_on "Create Student grade"

    assert_text "Student grade was successfully created"
    click_on "Back"
  end

  test "should update Student grade" do
    visit student_grade_url(@student_grade)
    click_on "Edit this student grade", match: :first

    fill_in "Course", with: @student_grade.course_id
    fill_in "Date", with: @student_grade.date
    fill_in "Grade", with: @student_grade.grade
    fill_in "Student", with: @student_grade.student_id
    fill_in "Teacher", with: @student_grade.teacher_id
    fill_in "Test", with: @student_grade.test_id
    click_on "Update Student grade"

    assert_text "Student grade was successfully updated"
    click_on "Back"
  end

  test "should destroy Student grade" do
    visit student_grade_url(@student_grade)
    click_on "Destroy this student grade", match: :first

    assert_text "Student grade was successfully destroyed"
  end
end
