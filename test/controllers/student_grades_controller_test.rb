require "test_helper"

class StudentGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_grade = student_grades(:one)
  end

  test "should get index" do
    get student_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_student_grade_url
    assert_response :success
  end

  test "should create student_grade" do
    assert_difference("StudentGrade.count") do
      post student_grades_url, params: { student_grade: { course_id: @student_grade.course_id, date: @student_grade.date, grade: @student_grade.grade, student_id: @student_grade.student_id, teacher_id: @student_grade.teacher_id, test_id: @student_grade.test_id } }
    end

    assert_redirected_to student_grade_url(StudentGrade.last)
  end

  test "should show student_grade" do
    get student_grade_url(@student_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_grade_url(@student_grade)
    assert_response :success
  end

  test "should update student_grade" do
    patch student_grade_url(@student_grade), params: { student_grade: { course_id: @student_grade.course_id, date: @student_grade.date, grade: @student_grade.grade, student_id: @student_grade.student_id, teacher_id: @student_grade.teacher_id, test_id: @student_grade.test_id } }
    assert_redirected_to student_grade_url(@student_grade)
  end

  test "should destroy student_grade" do
    assert_difference("StudentGrade.count", -1) do
      delete student_grade_url(@student_grade)
    end

    assert_redirected_to student_grades_url
  end
end
