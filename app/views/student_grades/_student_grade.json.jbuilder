json.extract! student_grade, :id, :grade, :date, :teacher_id, :student_id, :course_id, :test_id, :created_at, :updated_at
json.url student_grade_url(student_grade, format: :json)
