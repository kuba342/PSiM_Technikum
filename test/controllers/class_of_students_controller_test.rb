require "test_helper"

class ClassOfStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_of_student = class_of_students(:one)
  end

  test "should get index" do
    get class_of_students_url
    assert_response :success
  end

  test "should get new" do
    get new_class_of_student_url
    assert_response :success
  end

  test "should create class_of_student" do
    assert_difference("ClassOfStudent.count") do
      post class_of_students_url, params: { class_of_student: { symbol: @class_of_student.symbol, teacher_id: @class_of_student.teacher_id, yearOfStart: @class_of_student.yearOfStart } }
    end

    assert_redirected_to class_of_student_url(ClassOfStudent.last)
  end

  test "should show class_of_student" do
    get class_of_student_url(@class_of_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_of_student_url(@class_of_student)
    assert_response :success
  end

  test "should update class_of_student" do
    patch class_of_student_url(@class_of_student), params: { class_of_student: { symbol: @class_of_student.symbol, teacher_id: @class_of_student.teacher_id, yearOfStart: @class_of_student.yearOfStart } }
    assert_redirected_to class_of_student_url(@class_of_student)
  end

  test "should destroy class_of_student" do
    assert_difference("ClassOfStudent.count", -1) do
      delete class_of_student_url(@class_of_student)
    end

    assert_redirected_to class_of_students_url
  end
end
