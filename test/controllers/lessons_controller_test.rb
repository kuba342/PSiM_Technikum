require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
  end

  test "should get index" do
    get lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_url
    assert_response :success
  end

  test "should create lesson" do
    assert_difference("Lesson.count") do
      post lessons_url, params: { lesson: { animal_id: @lesson.animal_id, class_of_student_id: @lesson.class_of_student_id, classroom_id: @lesson.classroom_id, course_id: @lesson.course_id, date: @lesson.date, teacher_id: @lesson.teacher_id, test_id: @lesson.test_id } }
    end

    assert_redirected_to lesson_url(Lesson.last)
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_url(@lesson)
    assert_response :success
  end

  test "should update lesson" do
    patch lesson_url(@lesson), params: { lesson: { animal_id: @lesson.animal_id, class_of_student_id: @lesson.class_of_student_id, classroom_id: @lesson.classroom_id, course_id: @lesson.course_id, date: @lesson.date, teacher_id: @lesson.teacher_id, test_id: @lesson.test_id } }
    assert_redirected_to lesson_url(@lesson)
  end

  test "should destroy lesson" do
    assert_difference("Lesson.count", -1) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to lessons_url
  end
end
