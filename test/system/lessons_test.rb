require "application_system_test_case"

class LessonsTest < ApplicationSystemTestCase
  setup do
    @lesson = lessons(:one)
  end

  test "visiting the index" do
    visit lessons_url
    assert_selector "h1", text: "Lessons"
  end

  test "should create lesson" do
    visit lessons_url
    click_on "New lesson"

    fill_in "Animal", with: @lesson.animal_id
    fill_in "Class of student", with: @lesson.class_of_student_id
    fill_in "Classroom", with: @lesson.classroom_id
    fill_in "Course", with: @lesson.course_id
    fill_in "Date", with: @lesson.date
    fill_in "Teacher", with: @lesson.teacher_id
    fill_in "Test", with: @lesson.test_id
    click_on "Create Lesson"

    assert_text "Lesson was successfully created"
    click_on "Back"
  end

  test "should update Lesson" do
    visit lesson_url(@lesson)
    click_on "Edit this lesson", match: :first

    fill_in "Animal", with: @lesson.animal_id
    fill_in "Class of student", with: @lesson.class_of_student_id
    fill_in "Classroom", with: @lesson.classroom_id
    fill_in "Course", with: @lesson.course_id
    fill_in "Date", with: @lesson.date
    fill_in "Teacher", with: @lesson.teacher_id
    fill_in "Test", with: @lesson.test_id
    click_on "Update Lesson"

    assert_text "Lesson was successfully updated"
    click_on "Back"
  end

  test "should destroy Lesson" do
    visit lesson_url(@lesson)
    click_on "Destroy this lesson", match: :first

    assert_text "Lesson was successfully destroyed"
  end
end
